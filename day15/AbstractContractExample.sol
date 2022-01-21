pragma solidity ^0.4.25;

contract AbstractContractExample {

    address private owner;

    constructor() internal {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require();
        _;
    }

    function isOwner() public view returns (bool) {
        return owner == msg.sender;
    }
}

contract SpecificContract is AbstractContractExample {
    string public defaultName = "vector";
    function modifyName(string _name) public onlyOwner {
        defaultName = _name;
    }
}
