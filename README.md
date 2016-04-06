## RSA signature verification in Ethereum

Please first read [this blog post](https://medium.com/p/48daa16a4b51) explaining the landscape.

Good, so you are interested how this is done in practice.  The high level description is explained in [this EIP proposal](https://github.com/ethereum/EIPs/issues/74).

You'll need the following pieces to try this out:
- browser-solidity with rsaverify support
- the attached `rsaverify.sol` for the wrapper in Solidity
- and a piece of Solidity code using it

### Example code

```
import "https://github.com/axic/ethereum-rsa/rsaverify.sol";

contract Test {
  function test(bytes msg, bytes N, uint e, bytes S) returns (bool) {
    return RSAVerify.rsaverify(msg, N, e, S, 1);
  }
}
```

And then pass one of the following sample inputs:

1) 512 bit key

- `msg`: `0xcd8d103034f3796038d906de40faf3c3ba118a6b`
- `N`: `0x00890e68c2485f2c725116f259a7ac871e1de3618dfc41e1df8eacc0131b2d433de6ed6d1f36bbf5a401d5afa32eeb2d444cf02a920c81f8088ba0b99d47a0bfdf`
- `e`: `65537`
- `S`: `0x77c6b0c53800d37b6b946df6d91a693c25b1ba97cac16879a10b3231a5cea0932a0bc16443b2e82b33ec155a61b29572a5faaf574152bd509a248fdb8ed9d7af`
- `paddingScheme`: `1`

2) 2048 bit key

- `msg`: `0x70dd0c1b74d12222bc1e5257bd8c2d45b816202c`
- `N`: `0x00a2904487e49592a42890964f2a758ce58af027ba0fd68f6c9a5684a2d963b6af4127b91e0b9c084aeb0cd9cc81328433d8ed178e4c696c199e2a3d899f85b02f2d16023b57d06ada7e7ab46b49978063d739c9697b3b119783ba870132ac5bba37ccbd99b99a8188fcae7ccce24525dc03c50f78c7a043cc6c2589c90b3f717851d7de5f62d0eafe81aba1287d8e674750090e521589187613518892603dcb9ff37051616805e6fae9ff6185d8037711f2a8cf37db8ccad45fa4410d0e354a029268b22192fabaa45d0b6c72314682143f7e14603a40a9e314644b69cba10910dc651b5fa559a7df46a7758331b24e4ae1a050d280420a49b6119b6e61827749`
- `e`: `65537`
- `S`: `0x1650a750994065226a299be192530fb5575dafe752427f91adb9dadbca968e7edc56db9d3da7550fc2903d2b6a7e0a6452db83855b8a54ff523bdcd4b987640a9939b3f691fae1eac3c0674b1bdb8d4dcf8c2ad003a5ee68bfff34c12ac70081cd817fabc0820d730c7e8f9e4960a7724c8882e65196f6477c85602da607e496f1f5e59f1a346d46ec72ba44cf5b1a562bf4f9c408c2d0c12fb68be0872048700485385414ff76485a0c29d4ed8ccc9594261dc4d54f71ace0878956e918405bd2f41cfd47404c3b63bf4d734d71d72f9df4382790b506f10fb73450b5ad4302b3e232f7deef1d3541c505e3e87b9e24b329a8b95f0ff7be5d4685bafafb84db`
- `paddingScheme`: `1`

### Building ethereumjs-vm

1. Clone https://github.com/ethereumjs/browser-builds and change the `ethereumjs-vm` version in `package.json` to:
`git+https://github.com/axic/ethereumjs-vm#feature/rsaverify`

2. Run `./build.sh`

3. Take `dist/ethereumjs-vm.js`

### Building browser-solidity

1. Follow the instructions in https://github.com/chriseth/browser-solidity about running it locally.

2. Replace `assets/js/ethereumjs-vm.js` with the one created in the previous process.

3. Congratulations, you now have a working environment.

### The changed sources

- https://github.com/axic/ethereumjs-vm/tree/feature/rsaverify
- https://github.com/axic/ethereumjs-util/tree/feature/rsaverify

## License

MIT License

Copyright (C) 2016 Alex Beregszaszi
