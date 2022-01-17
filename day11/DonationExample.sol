pragma solidity ^0.4.25;

contract DonationExample {
    mapping(address => uint) public ledger;
    mapping(address => bool) public donors;
    address[] public donorList;

    function isDonor(address addr) internal view returns (bool) {
        return donors[addr];
    }

    function donate() public payable{
        if (msg.value >= 1 ether) {
            if(!isDonor(msg.sender)) {
                donors[msg.sender] = true;
                donorList.push(msg.sender);
            }
            ledger[msg.sender] += msg.value;
        } else {
            revert("donate value smaller than 1 ether!!!");
        }
    }

}