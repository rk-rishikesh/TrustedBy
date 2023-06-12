// SPDX-License-Identifier: MIT

pragma solidity 0.8.10;

library Events {


    event RegisteryCreated(
        address indexed creator,
        address indexed registryAddress
    );

    event ProfileCreated(
        address indexed registryAddress,
        address indexed profileOwnerAddress,
        string name
    );

    event ProfileTransferred(
        address indexed registryAddress,
        address indexed oldOwner,
        address indexed newOwner,
        string name
    );


    /// @dev Emitted when a document is stored
    /// @param docHash: hash value of the document
    /// @param docsMerkelRoot: Merkel Root of merkel tree in which the document hash is stored
    /// @param issuerAddress: wallet account address of the issuer
    event documentStored(
        bytes32 docHash,
        bytes32 docsMerkelRoot,
        address issuerAddress
    );

}