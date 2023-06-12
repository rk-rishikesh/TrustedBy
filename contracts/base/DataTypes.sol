// SPDX-License-Identifier: MIT

pragma solidity 0.8.10;

/**¯¯¯¯¯¯¯¯¯
 * @title DataTypes
 * @author TrustedBy
 *
 * @notice A standard library of data types used throughout the TrustedBy contracts.
 */
library DataTypes {
    
    /**
     * @notice A struct containing the necessary information to reconstruct an EIP-712 typed data signature.
     *
     * @param v The signature's recovery parameter.
     * @param r The signature's r parameter.
     * @param s The signature's s parameter
     * @param deadline The signature's deadline
     */
    struct EIP712Signature {
        uint8 v;
        bytes32 r;
        bytes32 s;
        uint256 deadline;
    }


    struct ProfileStruct {
        uint256 dossierCount;
        address profileOwnerAddress;
        string name;
        string profileURI;
    }


    struct SetProfileImageURIWithSigData {
        uint256 profileId;
        string imageURI;
        EIP712Signature sig;
    }

}
