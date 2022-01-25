#### library

please reference:https://docs.soliditylang.org/en/v0.8.11/contracts.html#libraries

Libraries are similar to contracts, but their purpose is that they are deployed only once at a specific address and their code is reused using the DELEGATECALL (CALLCODE until Homestead) feature of the EVM.


#### Set

Solidity 中有mapping 的type，能让我们储存type=> type的数据结构

通过library把mapping 包装成常见的set结构

Set.Insert(key)

Set.Remove(key)

Set.Contain(key)