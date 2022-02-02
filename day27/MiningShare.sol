pragma solidity ^0.4.25;

import "../day25/SafeMath.sol";

contract MiningShare {

    using SafeMath for uint256;

    //发起人
    address private owner = 0x0;
    //募资时间
    uint256 private closeBlock = 0;
    //投资人
    //投资金额
    mapping(address => uint256) private usersDollar;
    //领取金额
    mapping(address => uint256) private usersWithdrawDollar;
    //记录参数
    //总投资金额
    uint256 private totalDollar;
    //总提取金额
    uint256 private totalWithdraw;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier beforeCloseBlock() {
        require(block.number <= closeBlock);
        _;
    }

    modifier afterCloseBlock() {
        require(block.number > closeBlock);
        _;
    }

    modifier onlyShareHolders() {
        require(usersDollar[msg.sender] != 0);
        _;
    }


    //发起人的功能
    constructor() public {
        owner = msg.sender;
        closeBlock = block.number+2000;//该合约被部署上链后拿到的那个block
    }

    function CapitalIncrease(address account,uint256 dollar) public onlyOwner beforeCloseBlock {
        usersDollar[account] = usersDollar[account].add(dollar);
        totalDollar = totalDollar.add(dollar);
    }

    function CapitalDecrease(address account,uint256 dollar) public onlyOwner beforeCloseBlock {
        usersDollar[account] = usersDollar[account].sub(dollar);
        totalDollar = totalDollar.sub(dollar);
    }

    //投资人的功能
    function SupporterBalance() public constant onlyShareHolders returns (uint256) {
        return usersDollar[msg.sender];
    }

    function SupporterWithdraw() public constant onlyShareHolders afterCloseBlock returns (uint256) {
        return usersWithdrawDollar[msg.sender];
    }

    //总挖矿收益:现在的balance+被领走的token数量
    function TotalMined() public constant onlyShareHolders afterCloseBlock returns (uint256) {
        return totalWithdraw.add(address(this).balance);
    }

    //withdraw profit
    function Withdraw() public onlyShareHolders afterCloseBlock {
        uint256 totalMined = totalWithdraw.add(address(this).balance);
        //总共挖出的token  投资人应该分的token数量 - 投资人已经领的token 就是剩下投资人该领取的数量
        uint256 userCanWithdraw = totalMined.mul(usersDollar[msg.sender].div(totalDollar)).sub(usersWithdrawDollar[msg.sender]);
        usersWithdrawDollar[msg.sender] = usersWithdrawDollar[msg.sender].add(userCanWithdraw);
        totalWithdraw = totalWithdraw.add(userCanWithdraw);
        msg.sender.transfer(userCanWithdraw);
    }
}
