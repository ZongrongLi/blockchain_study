  
- reentry:   
    1. Ensure all state changes happen before calling external contracts 确定调用外部合约之前已经发生所有的状态更改  
    2. Use function modifiers that prevent re-entrancy 使用modifier  
  
```sol  
    modifier noReentrant() {  
        require(!locked, "No re-entrancy");  
        locked = true;  
        _;  
        locked = false;  
    }  
```  
  
  
- overflow:    
    1. Use SafeMath to will prevent arithmetic overflow and underflow   
    2. Solidity 0.8 defaults to throwing an error for overflow / underflow 0.8以上溢出抛出错误  
  
selfdestruct:  
// EtherGame 没有receive 和 fallback函数 所以只能通过deposit 来放钱进去  
// 但是可以通过slefdestruct 强行发钱进合约,绕开逻辑 这样EtherGame 里面就有7个币 但是没有winner  
// 如果确定了deposit 是唯一进钱的途径 , 自己维护一个balance 而不是使用真正的余额, 因为有可能不一致    
  
  
- 获取private数据:    
可以通过底层编码获得    
Don't store sensitive information on the blockchain. 不要存敏感数据  
  
- delegatecall:    
用delegatecall的时候永远记住两件事:    
You must keep 2 things in mind when using delegatecall  
  
- delegatecall preserves context (storage, caller, etc...)  
storage layout must be the same for the contract calling delegatecall and the contract getting called  
  
  
- delegatecall 用不好会带来灾难性的结果 这个没怎么懂    
delegatecall is tricky to use and wrong usage or incorrect understanding can lead to devastating results.  
  
- randomness
// 这个简单 块hash 和 timstamp 都是是可靠的随机数来源 因为可以重放  
  
  
- Denial of Service:  
要给一个人转钱  要确定他是不是可以被转钱的, 如果一个合约没有fallback 函数 和receive  就不能被转钱  
最好就是让人自己把钱退回去 而不是主动发  
  
  
  
- Hiding Malicious Code with External Contract  
构造函数传递至的都不靠谱  在构造函数里面new  并公开外部合约地址


- Honeypot:
看看就行 一个陷阱 但是withdraw永远会失败

- Front Running
多花手续费的先被确认 早知道了 


- Block Timestamp Manipulation
只要不超过上一个快的时间,  然后别太久 minner 就能操纵时间

- 签名重放
    维护一个execute状态 
    + nounce

- Bypass Contract Size Check
合约存储空间大小返回0


