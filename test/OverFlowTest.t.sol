//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {console, Test} from "forge-std/Test.sol";
import {OverFlow} from "../src/overFlow.sol";

contract OverFlowTest is Test {
    OverFlow public over;

    function setUp() public {
        over = new OverFlow();
    }

    function Test_increment() public {
        vm.expectRevert(); //Solidity should revert due to over flow protection
        over.increment(); 
    }
    function Test_decrement() public {
        vm.expectRevert(); //Solidity should revert due to under flow protection
        over.decrement();
    }
}