## Graph 介绍
本地部署流程:



1. 运行graph_node
https://github.com/graphprotocol/graph-node/
安装ipfs , postgres 
run :
```bash
sudo cargo run -p graph-node --release -- \
              --postgres-url postgresql://postgres:12345@localhost:5432/graph-node \
              --ethereum-rpc localhost:http://127.0.0.1:7545 --ipfs 127.0.0.1:5001
```

2. subgraph

https://thegraph.academy/developers/local-development/

sudo graph init --studio test_subgraph  
先随便选一个主网
中间需要合约地址 要先部署好(npx hardhat run ./scripts/deploy.js --network localhost)
abi 填原项目的abi
修改 ./scripts/schema.graphql 和 ./scripts/mapping.ts

yarn && yarn codegen
产生generate
更改yaml       
network, entities, 

graphsql.yaml:
```yaml
specVersion: 0.0.2
schema:
  file: ./schema.graphql
dataSources:
  - kind: ethereum
    name: SimpleToken
    network: localhost
    source:
      address: "0x47A4ea475937458090BEC345F08bB4da31D7b230"
      abi: SimpleToken
    mapping:
      kind: ethereum/events
      apiVersion: 0.0.5
      language: wasm/assemblyscript
      entities:
        - TransferEntity
        - ApprovalEntity
      abis:
        - name: SimpleToken
          file: ./abis/SimpleToken.json
      eventHandlers:
        - event: Transfer(indexed address,indexed address,uint256)
          handler: handleTransfer
        - event: Approval(indexed address,indexed address,uint256)
          handler: handleApproval
      file: ./src/mapping.ts

```


yarn create-local &&  yarn deploy-local 
直接启动起来

Queries (HTTP):     http://localhost:8000/subgraphs/name/test_subgraph
Subscriptions (WS): http://localhost:8001/subgraphs/name/test_subgraph
