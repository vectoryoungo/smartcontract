pragma solidity ^0.4.0;

import "day22/SafeMath.sol";
import "day22/IERC20.sol"

contract ERC20 {
    using SafeMath for uint256;
    uint256 private _totalSupply;

    mapping(address => uint256) _balances;
    mapping(address => mapping(address => uint256)) _approve;

    //所有存在的token的数量，如果挖矿的话，totalSupply的数量会变动
    function totalSupply() external view returns (uint256){
        return _totalSupply;
    }
    //读取tokenOwner这个address所持有的token数量
    function balanceOf(address tokenOwner) external view returns (uint256 balance){
        return _balances[tokenOwner];
    }
    //从msg.sender转tokens个token给to这个address
    function transfer(address to,uint256 tokens) external returns (bool success){
        return internalTransfer(msg.sender,to,tokens);
    }
    //得到tokenOwner授权给spender使用的token剩余数量
    function allowance(address tokenOwner,address spender) external view returns (uint256 remaining){
        return _approve[tokenOwner][spender];
    }
    //msg.sender授权给spender可使用自己的tokens个token
    function approve(address spender,uint256 tokens) external returns (bool success){
        _approve[msg.sender][spender] = tokens;
        emit Approval(msg.sender,spender,tokens);
        return true;
    }
    //将tokens个token从from转到to地址,是msg.sender花费from这个地址授权给他让他花的钱
    function transferFrom(address from,address to,uint256 tokens) external returns (bool success){
        _approve[from][msg.sender] = _approve[from][msg.sender].sub(tokens);

        return internalTransfer(from,to,tokens);
    }

    function internalTransfer(address from,address to,uint256 tokens) internal returns (bool success){
        _balances[from] = _balances[from].sub(tokens);
        _balances[to] = _balances[to].add(tokens);
        emit Transfer(from,to,tokens);
        return true;
    }
};
