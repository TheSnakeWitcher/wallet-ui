# Portal

Portal is a wallet


## Features

![dashboard](./img/portal-dashboard.png)

- [x] account abstraction 
    - create user operations or batch transactions together (e.g., approve and execute a swap in one go)
    - account management
        - [zkLogin sui](https://sui.io/zklogin) and [zkLogin eth](https://github.com/shield-labs/zklogin)
        - account recovery
        - flexible security rules(share your account security across trusted devices or individuals)
    - gas abstraction(pay someone else's gas, or have someone else pay yours, maybe in tokens)
    - intent-like blockchain interaction maybe using AI agents

- [x] protocol agnostic crosschain transfers(starts with [chainlink CCIP](https://docs.chain.link/ccip))

![payments](./img/portal-payments.png)

- [x] payments(scheduled/batch payments and crypto invoice for b2b)
    bills: payment scheduled to be executed(like, a notification to remind me to send 1 USDT monthly)
    invoices: payment scheduled to be received

![contracts](./img/portal-contracts.png)

- [x] contract interaction(probably using [cast](https://book.getfoundry.sh/cast/))
    - interact with contracts(including contracts in local networks)
    - abi management(fetch ABI for verified contracts, provide ABI for unverified ones, store and delete ABIs)


![networks](./img/portal-networks.png)

- [x] Network management([chainlist](https://chainlist.org/))

## Features ?

- [ ] allow to interact with arbitrary plugins/protocols(anvil,dp2p,dex,aave)
- [ ] social( maybe some integration with contact software or CRM)
- [ ] finance management(maybe to keep track of cashflow)

