pragma solidity ^0.4.25;

contract DonateFullFeatureExample {

    struct DonorInfo{
        address[] donors;
        mapping(address => uint) ledger;
    }

    mapping(address => DonorInfo)DonorHistory;

    event LogDonate(address streamer,address donor,string nickname,
        uint value,string message);

    function donate(address _streamer,string _nickname,string _message) public payable{
        require(msg.value > 0);
        _streamer.transfer(msg.value);

        //haven't donate any money
        if (DonorHistory[_streamer].ledger[msg.sender] == 0) {
            DonorHistory[_streamer].donors.push(msg.sender);
        }

        DonorHistory[_streamer].ledger[msg.sender] += msg.value;

        emit LogDonate(_streamer,msg.sender,_nickname,msg.value,_message);
    }

    function getDonorList() public view returns (address[] ){
        return DonorHistory[msg.sender].donors;
    }

    event LogListDonorInfo(address streamer,address user,uint value);
    function listDonorInfo() public {
        for (uint i = 0; i < DonorHistory[msg.sender].donors.length; i++) {
            address user = DonorHistory[msg.sender].donors[i];
            emit LogListDonorInfo(msg.sender,user,DonorHistory[msg.sender].ledger[user]);
        }
    }
}