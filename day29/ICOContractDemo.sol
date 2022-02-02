pragma solidity ^0.4.25;

import "../day22/SafeMath.sol";
import "../day29/ICOToken.sol";
import "../day22/IERC20.sol";

contract ICOContractDemo {

    using SafeMath for uint256;

    address private owner = 0x0;
    address public tokenAddress;
    //为了记录发售的数量，最大的募集的资金
    uint256 totalCapital = 0;
    //目前募集的资金
    uint256 currentFund = 0;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    enum ICOState {PREPARE,START,END}

    ICOSate icoState = ICOState.PREPARE;

    modifier beforeICO() {
        require(icoState == ICOState.PREPARE);
        _;
    }

    modifier whenICO() {
        require(icoState == ICOState.START);
        _;
    }

    modifier endICO() {
        require(icoState == ICOState.END);
        _;
    }

    constructor() public {
        owner = msg.sender;
        string memory name = "vToken";
        uint8 decimals = 18;
        string memory symbol = "VT";
        uint256 totalSupply = 1000 * (10 ** 18);
        totalCapital = totalSupply;
        tokenAddress = new ICOToken(name,decimals,symbol,totalSupply);
    }

    function startICO() public onlyOwner beforeICO {
        icoState = ICOState.START;
    }

    function endICO() public onlyOwner whenICO {
        icoState = ICOState.END;
        owner.transfer(address(this).balance);
        IERC20(tokenAddress).transfer(owner,totalCapital.sub(currentFund));
    }

    function() public payable whenICO{
        require(msg.value > 0);
        require(totalCapital.sub(currentFund) >= msg.value);
        currentFund = currentFund.add(msg.value);
        IERC20(tokenAddress).transfer(msg.sender,msg.value);
    }

}
