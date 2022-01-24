pragma solidity ^0.4.25;

interface InterfaceExample {
    function run(uint speed) external returns (uint);
}

contract Cat is InterfaceExample {
    function run(uint speed) public returns (uint distance) {
        return speed * speed;
    }
}

contract Duck is InterfaceExample {
    function run(uint speed) public returns (uint distance) {
        return speed * 2;
    }
}
