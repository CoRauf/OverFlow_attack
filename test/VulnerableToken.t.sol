//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {console, Test} from "forge-std/Test.sol";
import {VulnerableToken} from "../src/VulnerableToken.sol";

contract VulenrableTokenTest is Test{
    VulnerableToken Token;
    address attacker = address(1);

    function setUp() public {
        Token = new VulnerableToken();
        vm.prank(attacker);
        Token.mint(100);
    }

    function test_mint() public {
        vm.prank(attacker);
        Token.mint(type(uint256).max);
        //Overflow happens here
        
    }

    function test_transfer() public{
        vm.prank(address(2));
        Token.mint(50);

        vm.prank(attacker);
        Token.transfer(address(2), 101);

        console.log(Token.balances(attacker));
    }
}