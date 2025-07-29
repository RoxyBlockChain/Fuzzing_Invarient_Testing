
// SPDX-License-Identifier: MIT
// File: src/Safe.sol

pragma solidity ^0.8.30;

contract Safe {
    receive() external payable {}
 
    function withdraw() external {
        payable(msg.sender).transfer(address(this).balance);
    }
}