pragma solidity ^0.4.0;

interface IERC20 {
    //所有存在的token的数量，如果挖矿的话，totalSupply的数量会变动
    function totalSupply() external view returns (uint256);
    //读取tokenOwner这个address所持有的token数量
    function balanceOf(address tokenOwner) external view returns (uint256 balance);
    //从msg.sender转tokens个token给to这个address
    function transfer(address to,uint256 tokens) external returns (bool success);
    //得到tokenOwner授权给spender使用的token剩余数量
    function allowance(address tokenOwner,address spender) external view returns (uint256 remaining);
    //msg.sender授权给spender可使用自己的tokens个token
    function approve(address spender,uint256 tokens) external returns (bool success);
    //将tokens个token从from转到to地址,是msg.sender花费from这个地址授权给他让他花的钱
    function transferFrom(address from,address to,uint256 tokens) external returns (bool success);

    //相当于记录了转账记录方便做追踪
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 tokens
    );
    //也相当于记录了授权的流水
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 tokens
    );
}




