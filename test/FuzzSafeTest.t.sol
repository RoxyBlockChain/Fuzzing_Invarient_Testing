
//SPDX-License-Identifier: MIT
// File: test/SafeTest.t.sol
pragma solidity ^0.8.30;

import "forge-std/Test.sol";
import "../src/Safe.sol";
// File: test/SafeTest.t.sol


contract FuzzSafeTest is Test {
    Safe safe;
 
    // Needed so the test contract itself can receive ether
    // when withdrawing
    receive() external payable {}
 
    function setUp() public {
        safe = new Safe();
    }

    //The default amount of ether that the test contract is given is 2**96 wei (as in DappTools), 
    // so we have to restrict the type of amount to uint96 to make sure we don't try to send more than we have:
    function testFuzz_Withdraw(uint96 amount) public {
        payable(address(safe)).transfer(amount);
        uint256 preBalance = address(this).balance;
        safe.withdraw();
        uint256 postBalance = address(this).balance;
        assertEq(preBalance + amount, postBalance);
    }
}