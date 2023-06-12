// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "../base/DataTypes.sol";

interface ITrustedIssuer {

    function createProfile(
        address to,
        DataTypes.ProfileStruct calldata vars
    ) external;
    

    function transferProfile(
        string calldata name,
        address _to
    ) external;
   
}
