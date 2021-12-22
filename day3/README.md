# smartcontract
learning smart contract programming

**visibility**

public: call inside/outside contract 任何使用者或者合約都能呼叫和訪問。

external:only call from outside contract 與public 類似，只不過這些函式只能在合約之外呼叫 - 它們不能被合約內的其他函式呼叫。

internal: only call from inside contract 和 private 類似，不過， 如果某個合約繼承自其父合約，這個合約即可以訪問父合約中定義的“內部”函式。

private：only call from  inside contract 只能在其所在的合約中呼叫和訪問，即使是其子合約也沒有許可權訪問

https://img-blog.csdnimg.cn/20181226150923459.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzM0MzE0NA==,size_16,color_FFFFFF,t_70