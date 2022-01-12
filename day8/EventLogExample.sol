// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.22 <0.8.0;

contract EventLogExample{
    string information;
    uint balance;

    event logCreate(string information,uint balance);
    event logCreateIndex(string indexed information,uint indexed balance);

    constructor() public {
        information = "vector";
        balance = 1000;
        emit logCreate(information,balance);
        emit logCreateIndex(information,balance);
    }
}
