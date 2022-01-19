pragma solidity ^0.4.25;

contract DonateExampleAll {
    mapping(address => uint) public ledger;
    address[] public donorList;

    event LogDonate(address streamer,address donor,string nickname,
        uint value,string message);

    function donate(address _streamer,string _nickname,string _message) public payable{
        _streamer.transfer(msg.value);
        ledger[msg.sender] = msg.value;
        donorList.push(msg.sender);
        emit LogDonate(_streamer,msg.sender,_nickname,msg.value,_message);
    }
}