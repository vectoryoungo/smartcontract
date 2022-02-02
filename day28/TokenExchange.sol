pragma solidity ^0.4.25;

import "../day25/IERC20.sol";

contract TokenExchange {

    address fromAddress;
    address fromToken;
    uint256 fromAmount;
    address toToken;
    uint256 toAmount;


    function CreateExchange(address _fromToken,uint256 _fromAmount,address _toToken,uint256 _toAmount) public{
        require(IERC20(_fromToken).transferFrom(msg.sender,this,_fromAmount));
        fromAddress = msg.sender;
        fromToken = _fromToken;
        fromAmount = _fromAmount;
        toToken = _toToken;
        toAmount = _toAmount;
    }

    function DoChange() public {
        require(IERC20(toToken).transferFrom(msg.sender,this,toAmount));
        IERC20(fromToken).transfer(msg.sender,fromAmount);
        IERC20(toToken).transfer(fromAddress,toAmount);
    }
}
