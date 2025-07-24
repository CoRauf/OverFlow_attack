//SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

import {console, Test} from "forge-std/Test.sol";
import {VulnerableERC20} from "../src/VulnerableERC20.sol";

contract VUlnerableERC20Test is Test {
    VulnerableERC20 public vulnerable;

    function setUp() public {
        vulnerable = new VulnerableERC20();
    }

    function test_transfer() public {
        vm.startPrank(address(1));
        vulnerable.transfer(address(2), type(uint256).max);
        console.log(vulnerable.getBalance(address(2)));
        vm.stopPrank();
    }

    
}