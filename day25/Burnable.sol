pragma solidity ^0.4.25;

import "../day22/ERC20.sol";

contract Burnable is ERC20{

    function burn(uint256 tokens) public returns (bool success) {
        //查看余额是不是够
        //减少total _totalSupply
        //减少msg.sender的 balance
        require(tokens <= _balances[msg.sender]);
        _totalSupply = _totalSupply.sub(tokens);
        _balances[msg.sender] = _balances[msg.sender].sub(tokens);
        return true;
    }

}
