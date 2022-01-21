#### Abstract Contract 

contract A is B {} 的形式声明

A继承B合约，如果B是一个Abstract Contract的话，则A需要实现B合约没实现的function

constructor() internal {} Internal这个关键字强迫这个contract变成一个Abstract Contract

