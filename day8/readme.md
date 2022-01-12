**event&log**

**Tx Receipt**

Transaction 被发送之后，会产生一个Receipt来储存执行结果

Receipt包含了

- 该TX花费的gas
- 该TX中产生的logs

**Logs**

Logs包含：

- address：
- blockHash，blockNumber，transactionHash，transactionIndex
- logIndex：第几个log
- data：raw data（32 bytes为单位）
- topics：识别值

**topics**

- topics是一个特殊的识别栏位，filter的搜索目标
- topics在每个log中只能有四个
- topics的第一个栏位固定为该log的identifier做Keccak-256后的值

  比如event eg(int a) -> eg(int256)
  经过keccak-256->
  0xfecxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
 
 
**event name(arguments)**

- name 为该log的名字

- arguments 可有多个，比如：
 
    event eg(int a,int b,....);
   
**调用log方式 emit name(parameters)**

- 要发送log需要使用emit语法
- parameters为该log所需要的资讯

**multiple topics**

- 最多可在三个不同的arguments加上indexed modifier
- 该argument作为一个topic 存在receipt的topics 中
- array 形态的资料（如string或bytes）会通过keccak-256()以后存储，因此没办法知道这类资料原来的样子。
