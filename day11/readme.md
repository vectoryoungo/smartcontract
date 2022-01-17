#### Mapping

mapping(T1 => T2) var;

- 提供key -> value的数据结构；
- T1 可以是除了mapping以外的所有type，因为实际储存的时候，T1原本的数据并不会被储存下来，只会留下keccak256(T1)作为index
- T2可以是任何type

#### mapping.keys? 列举所有的key这个方法是没有的

mapping不能拿到现有的mapping中所有存在的key

所以如果想要iterate整个mapping请自己写helper function

#### use case

mapping[key] = value

mapping[key]