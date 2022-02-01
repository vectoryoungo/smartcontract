pragma solidity ^0.4.0;

import "../day22/ERC20.sol";

contract Mintable is ERC20{
    address private owner;
    mapping(address => bool) minters;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier onlyMinter() {
        require(minters[msg.sender]);
        _;
    }

    function addMinter(address addr) public onlyOwner return (bool success) {
        minters[addr] = true;
        return true;
    }

    function mint(address to,uint256 tokens) public onlyMinter returns (bool success) {
        _totalSupply = _totalSupply.add(tokens);
        _balances[to] = _balances[to].add(tokens);
        emit Transfer(address(0),to,tokens);
        return true;
    }

}
