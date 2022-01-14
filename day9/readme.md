#### fallback function

fallback function 是每个合约都有一个且只有一个没有名字的function。

这个function不能有任何参数也不能有任何的返回值。

以下两个行为触发fallback function：

- call/调用 contract时，调用不存在的function的时候会触发该fallback function
- Contract收到ether且没有携带data

fallback function可能被无意间触发，因此fallback function内最好减少gas的消耗，尽量少于2300gas

以下这些行为可能会导致gas 大于2300，在fallback中尽量不要使用

- Modify storage
- Create a contract
- Call an external function
- Send ethers

#### Undefined Fallback Function

- Contract 如果没有定义 fallback function，在收到ether时，将触发exception并且退回ether
- Contract想收ether 必须定义fallback function
- 且需要加上payable modifier 来表明该function可以收取ether

