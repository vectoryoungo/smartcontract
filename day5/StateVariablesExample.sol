// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract StateVariablesExample {
    string name;
    address owner;

    constructor() public {
        name = "vector";
        owner = msg.sender;
    }

    function setName(string memory _name) public returns(string memory) {
        if(msg.sender == owner) {
            name = _name;
        } else {
            revert("permission denied");
        }

        return name;
    }

    function getName() public view returns(string memory) {
        return name;
    }
}
