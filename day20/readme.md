#### ERC-20 interface

**什么是 ERC-20？**

**You can also reference:https://ethereum.org/zh/developers/docs/standards/tokens/erc-20/#top**

ERC-20 提供了一个同质化代币的标准，换句话说，每个代币与另一个代币（在类型和价值上）完全相同。 例如，一个 ERC-20 代币就像 ETH 一样，意味着一个代币会并永远会与其他代币一样。


ERC-20（以太坊意见征求 20）由 Fabian Vogelsteller 提出于 2015 年 11 月。这是一个能实现智能合约中代币的 API 标准。

它提供了多个功能。例如转账代币从一个帐户到不同的帐户，来实现获取帐户的当前余额以及网络上的可用令牌总供应量。 除此之外，它还具有其他功能，如批准代币花费到第三方帐户中。

如果智能合约实施了下列方法和事件，它可以被称为 ERC-20 代币合约， 一旦部署，将负责跟踪以太坊上创建的代币。

来自 EIP-20参考：https://eips.ethereum.org/EIPS/eip-20：

 
function name() public view returns (string)


function symbol() public view returns (string)


function decimals() public view returns (uint8)

//所有存在的token的数量
function totalSupply() public view returns (uint256)

//读取_owner这个address的所有的token的数量
function balanceOf(address _owner) public view returns (uint256 balance)

//从msg.sender转_value个token给_to这个address 
function transfer(address _to, uint256 _value) public returns (bool success)

//将_value个token从_from转到_to 
function transferFrom(address _from, address _to, uint256 _value) public returns (bool success)

//msg.sender授权给_spender可使用自己的_value个token
function approve(address _spender, uint256 _value) public returns (bool success)

//得到_owner授权给_spender使用的剩余数量
function allowance(address _owner, address _spender) public view returns (uint256 remaining)

事件：
event Transfer(address indexed _from, address indexed _to, uint256 _value)

event Approval(address indexed _owner, address indexed _spender, uint256 _value)
