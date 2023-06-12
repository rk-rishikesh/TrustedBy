// SPDX-License-Identifier: MIT

pragma solidity 0.8.10;

import {Constants} from "../contracts/base/Constants.sol";
import {DataTypes} from "./base/DataTypes.sol";
import {Errors} from "../contracts/base/Errors.sol";
import {Events} from "../contracts/base/Events.sol";
import "./interfaces/ITrustedIssuer.sol";

contract TrustedIssuer is ITrustedIssuer {
   
    mapping(string => DataTypes.ProfileStruct) profiles;

    modifier whenUnreserved(string memory _name) {
        require(profiles[_name].profileOwnerAddress == address(0));
        _;
    }

    modifier onlyOwnerOf(string memory _name) {
        require(profiles[_name].profileOwnerAddress == msg.sender);
        _;
    }

    modifier whenEntryExists(string memory _name) {
        require(profiles[_name].profileOwnerAddress != address(0));
        _;
    }
    
    function validateHandle(string calldata handle) private pure {
        bytes memory byteHandle = bytes(handle);
        if (
            byteHandle.length == 0 ||
            byteHandle.length > Constants.MAX_HANDLE_LENGTH
        ) revert Errors.TrustedIssuer_HandleLengthInvalid();
    }

    struct ProfileStruct {
        uint256 dossierCount;
        address profileOwnerAddress;
        string name;
        string imageURI;
    }

    function createProfile(
        address to,
        DataTypes.ProfileStruct calldata vars
    ) public whenUnreserved(vars.name) {
        validateHandle(vars.name);
        profiles[vars.name].profileOwnerAddress = to;
        profiles[vars.name].name = vars.name;
        emit Events.ProfileCreated(address(this), to, vars.name);
    }

    function transferProfile(
        string memory _name,
        address _to
    )
        external
        whenEntryExists(_name)
        onlyOwnerOf(_name)
    {
        profiles[_name].profileOwnerAddress = _to;
        emit Events.ProfileTransferred(address(this), msg.sender, _to, _name);
    }

    function setProfileStamp(
        string memory _name,
        string memory _profileURI
    )
        external
        whenEntryExists(_name)
        onlyOwnerOf(_name)
    {
        profiles[_name].profileURI = _profileURI;
    }
    
}