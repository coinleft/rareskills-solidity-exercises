// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract Deployer {
    string public greeting;

    /* This exercise assumes you know how constructors works.
    The contract must have a constructor with a string argument
    that sets the greeting variable, if not it reverts. */
    constructor(string memory str) {
        greeting = str;
        require(bytes(greeting).length != 0, "failed to set the greeting variable.");
    }
}
