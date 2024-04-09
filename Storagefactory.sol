// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./Simplestorage.sol";
contract Storagefactory{
    SimpleStorage[] public simplestoragearray;

    function createsimplestoragecontract() public {
        SimpleStorage simplestorage = new SimpleStorage();
        simplestoragearray.push(simplestorage);

    }
    function SFstore(uint256 _ssindex, uint256 _ssfavoritenumber) public {
        SimpleStorage simplestorage = simplestoragearray[_ssindex];
        simplestorage.store(_ssfavoritenumber);
    }
    function SFget(uint256 _ssindex) public view returns(uint256){
        SimpleStorage simplestorage = simplestoragearray[_ssindex];
        return simplestorage.retrieve();


    }


}
