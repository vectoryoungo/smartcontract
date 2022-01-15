### Address type

**address var;**

- address 代表了一个Ethereum Address；
- 20 bytes组成

<address>.balance -> uint256 可以得到address的balance（以wei为单位）

Wei是Ethereum中的最小单位

1Eth = 10的3次方Finney = 10的6次方Szabo = 10的18次方wei

<address>.send(uint256 amount) 对<address>发送amount wei。

该function会forward 2300 gas作为调用gas。 因为send将会触发<address>中的fallback function

执行失败会返回false否则返回true

<address>.transfer(uint256 amount)对<address>发送amount wei。

该function会forward 2300 gas作为调用gas。 因为send将会触发<address>中的fallback function

执行失败会throw exception。

### Transfer VS Send

Transfer保证了转移Ether的正确性，因为失败的时候会让整个transaction收到throw而终止

Send在执行失败只会回传false，因此在使用Send时，应该每次都检查他的回传值。比如搭配require()。
