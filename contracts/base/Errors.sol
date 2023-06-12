// SPDX-License-Identifier: MIT

pragma solidity 0.8.10;

library Errors {
   
    error SignatureExpired();
    
    error SignatureInvalid();

    error TrustedIssuer_HandleLengthInvalid();

    error TrustedBy_DocumentAlreadyExists(bytes32 docHash, bytes32 docsMerkelRoot);

}