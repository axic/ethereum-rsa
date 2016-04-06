//
// Solidity wrapper for the `rsaverify` precompiled contract.
//
// (C) 2016 Alex Beregszaszi
//
// MIT License
//

library RSAVerify {
    // This copies call data (everything, except the method signature) to the precompiled contract.
    function rsaverify(bytes msg, bytes N, uint e, bytes S, uint paddingScheme) returns (bool) {
        uint len;
        assembly {
            len := calldatasize()
        }

        bytes memory req = new bytes(len - 4);
        bytes memory res = new bytes(32);

        assembly {
            let alen := len
            calldatacopy(req, 4, alen)
            call(sub(gas, 150), 5, 0, req, alen, res, 32)
            // FIXME: check for return value (failed call)
            pop
            return (res, 32)
        }
     }
}
