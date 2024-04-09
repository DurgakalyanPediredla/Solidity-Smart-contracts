// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage{

    //if you don't give any number it will get initialized to zero.
    uint256 favoriteNumber;

    mapping(string=>uint256) public nametofavoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }
    //uint256 public favoritenumberlist;
    People[] public people;

    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber=_favoriteNumber;

    }
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }
    //calldata, memory, storage
    function addperson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nametofavoriteNumber[_name] =_favoriteNumber;

    }


}