# wo-infra

Deploys infrastructure required to test [waku-objects-playground](https://github.com/logos-innovation-lab/waku-objects-playground).

It works by deploying a `CREATE3` factory from `0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266` at nonce `0`, resulting in the `0xC9825E2FAe0233066A79B727B3166CfA22f638c4` contract address. It then deploying contracts to a fixed address based on a salt.

## Getting the address of a contract

Contract addresses can be computed based on the salt by calling `getDeployed(bytes32 salt)` on `CREATE3Factory` (`0xC9825E2FAe0233066A79B727B3166CfA22f638c4`).

The following ABI can be used:

```json
[
  {
    "inputs": [
      {
        "internalType": "bytes32",
        "name": "salt",
        "type": "bytes32"
      }
    ],
    "name": "getDeployed",
    "outputs": [
      {
        "internalType": "address",
        "name": "deployed",
        "type": "address"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  }
]
```

## Deployed contracts

- `DAI (MockERC20)`: `0x8482D57C31762FB8b97Ef07b668598AD4ff0a300`
- `SplitterFactory`: `0xb7aF397e6b4b21d54A616169e39eE24FE8652695`
