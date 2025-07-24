//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract OverFlow{

    uint8 public smallNumber = 255; //Max value of uint8
    uint256 public LargeNumber = 2**256 - 1; //Max number of uint256

    function increment() public {
        smallNumber += 1; //OverFlow occurs here
    }

    function decrement() public {
        LargeNumber -= 1; //UnderFlow occurs here
    }
}