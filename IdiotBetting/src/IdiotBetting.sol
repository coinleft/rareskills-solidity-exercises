// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract IdiotBettingGame {
    /*
        This exercise assumes you know how block.timestamp works.
        - Whoever deposits the most ether into a contract wins all the ether if no-one 
          else deposits after an hour.
        1. `bet` function allows users to deposit ether into the contract. 
           If the deposit is higher than the previous highest deposit, the endTime is 
           updated by current time + 1 hour, the highest deposit and winner are updated.
        2. `claimPrize` function can only be called by the winner after the betting 
           period has ended. It transfers the entire balance of the contract to the winner.
    */
    address payable public winner;
    mapping(address => uint256) public depositors;
    uint256 public currentTimestamp = block.timestamp;
    uint256 public endTime;

    function bet() public payable {
        // your code here
        depositors[msg.sender] += msg.value;
        if (depositors[msg.sender] > depositors[winner]) {
            winner = payable(msg.sender);
            endTime = currentTimestamp + 1 hours;
        }
    }

    function claimPrize() public {
        // your code here
        require(msg.sender == winner, 'can only be called by the winner');
        if (block.timestamp > endTime) {
            winner.transfer(address(this).balance);
        }
    }
}
