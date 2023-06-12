// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

contract TrustedBy {
    mapping(bytes32 => bytes32) document;

    event documentStored(
        bytes32 docHash,
        bytes32 docsMerkelRoot,
        address issuerAddress
    );

    constructor() {}

    function createDossier(bytes32 docHash, bytes32 docsMerkelRoot) public {
        document[docHash] = docsMerkelRoot;
        emit documentStored(docHash, docsMerkelRoot, msg.sender);
    }

    function toBytes32(address addr) internal pure returns (bytes32) {
        return bytes32(uint256(uint160(addr)));
    }

    function validateDocument(
        bytes32 docHash,
        bytes32[] calldata merkleProof
    ) public view returns (bool) {
        return
            MerkleProof.verify(
                merkleProof,
                document[docHash],
                toBytes32(msg.sender)
            );
    }
}
