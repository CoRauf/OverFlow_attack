//SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

import {console, Test} from "forge-std/Test.sol";

contract VulnerableToken {
    mapping(address => uint256) public balances;

     constructor() {
        balances[msg.sender] = 100;
        // Give the deployer some Token 
    }

    //No Overflow check 
    function mint(uint256 _amount ) public {
        console.log(_amount);
        unchecked {
        balances[msg.sender] += _amount;
        }
    }


    //No underflow check
    function transfer(address _to, uint256 _amount) public {
        unchecked {
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
        }
    }

    function burn(uint256 amount) public {
        unchecked {
        balances[msg.sender] -= amount;
        }
    }

    function getBalance(address _User) public view returns(uint256){
        return balances[_User];
    }
}