oracle base implement
互调 ,互相调用的中间在链下转一圈, 把外面的的信息带进去

1. 一个线程不断 upateprice 并为每一个price生成id , 并且myRequests[id] = true;


2. 结构:
两个合约 1.oracle 2.caller
oracle:
get:发event触发链外价格获得
set:
调用callback

caller:
触发get
收到最终结果

3. 流程:
调用getprice (返回一个ID) -> js 捕捉到getprice的event 在这里获取链外的数据data ,然后setprice(data,id) ->  合约里setprice 调用callback -> callback中用myRequests[id] 做noneentry
callback中调用者得到价格

