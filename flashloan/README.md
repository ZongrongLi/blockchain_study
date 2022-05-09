golang 伪代码
```go
//@ amount 借多少钱
//@ callback 回调函数 用户在这里面负责把钱加回去
//@ recipent 谁借的钱
func loan(amount int, callback func(),recipent string){
    balance = getbalance()
    transfer(address,amount)
    callback()
    balance1 = getbalance()
    if balance1 >=balance {
        return "success"
    }else{
        thow error
    }
}

func callback(amount int){
	balance = getBalance() // 得到借贷后的钱,  因为是在同一个节点,所以获得的状态也是借出钱的一方把钱转移到收钱的一方转移成功以后的钱 # 注意这个钱还没有被全网确认, 只是当前这个节点这么认为
	// 拿这个钱去干些事
	// ...
    	transfer(contractAddress,amount) // 把钱还上
}
```

完整的执行代码见:
