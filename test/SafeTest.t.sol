
//SPDX-License-Identifier: MIT
// File: test/SafeTest.t.sol
pragma solidity ^0.8.30;

import "forge-std/Test.sol";
import "../src/Safe.sol";
// File: test/SafeTest.t.sol

contract SafeTest is Test {
    Safe safe;
 
    // Needed so the test contract itself can receive ether
    // when withdrawing
    receive() external payable {}
 
    function setUp() public {
        safe = new Safe();
    }
 
    function test_Withdraw() public {
        payable(address(safe)).transfer(1 ether);
        uint256 preBalance = address(this).balance;
        safe.withdraw();
        uint256 postBalance = address(this).balance;
        assertEq(preBalance + 1 ether, postBalance);
    }
}