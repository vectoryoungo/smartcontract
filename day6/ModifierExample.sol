// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ModifierExample {
    string name;
    address owner;

    constructor() public {
        name = "vector";
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner,"permission denied");
        _;
    }

    function setName(string memory _name) public onlyOwner returns(string memory) {
        name = _name;
        return name;
    }

    function getName() public view returns(string memory) {
        return name;
    }

}