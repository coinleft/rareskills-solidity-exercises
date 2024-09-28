// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract TicTacToe {
    /* 
        This exercise assumes you know how to manipulate nested array.
        1. This contract checks if TicTacToe board is winning or not.
        2. Write your code in `isWinning` function that returns true if a board is winning
           or false if not.
        3. Board contains 1's and 0's elements and it is also a 3x3 nested array.
    */

    function isWinning(uint8[3][3] memory board) public pure returns (bool) {
        // your code here
        // 检查行
        for (uint8 i = 0; i < 3; i++) {
            if (board[i][0] == 1 && board[i][1] == 1 && board[i][2] == 1) {
                return true;
            }
        }

        // 检查列
        for (uint8 j = 0; j < 3; j++) {
            if (board[0][j] == 1 && board[1][j] == 1 && board[2][j] == 1) {
                return true;
            }
        }

        // 检查对角线
        if ((board[0][0] == 1 && board[1][1] == 1 && board[2][2] == 1) ||
            (board[0][2] == 1 && board[1][1] == 1 && board[2][0] == 1)) {
            return true;
        }

        return false;
    }
}
