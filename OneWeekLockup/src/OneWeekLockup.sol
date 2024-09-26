// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract OneWeekLockup {
    /**
     * In this exercise you are expected to create functions that let users deposit ether
     * Users can also withdraw their ether (not more than their deposit) but should only be able to do a week after their last deposit
     * Consider edge cases by which users might utilize to deposit ether
     *
     * Required function
     * - depositEther()
     * - withdrawEther(uint256 )
     * - balanceOf(address )
     */
    mapping(address => uint256) depositors;
    mapping(address => uint256) timestamp;
    function balanceOf(address user) public view returns (uint256) {
        // return the user's balance in the contract
        return depositors[user];
    }

    function depositEther() external payable {
        /// add code here
        depositors[msg.sender] += msg.value;
        timestamp[msg.sender] = block.timestamp;

    }

    function withdrawEther(uint256 amount) external {
        /// add code here
        require(balanceOf(msg.sender) >= amount, 'ethers not enough in your account');
        require(block.timestamp >= timestamp[msg.sender] + 7 days);
        depositors[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}

// contract OneWeekLockup {

//     // Struct to track user deposits and the last deposit timestamp
//     struct UserInfo {
//         uint256 balance;    // The user's deposited balance
//         uint256 lastDepositTime;  // The timestamp of their last deposit
//     }

//     // Mapping of user addresses to their deposit information
//     mapping(address => UserInfo) private users;

//     // Event to log deposits
//     event Deposit(address indexed user, uint256 amount);

//     // Event to log withdrawals
//     event Withdrawal(address indexed user, uint256 amount);

//     // Modifier to ensure the withdrawal can only happen after 1 week since the last deposit
//     modifier onlyAfterOneWeek(address _user) {
//         require(block.timestamp >= users[_user].lastDepositTime + 7 days, "You can only withdraw after 1 week");
//         _;
//     }

//     function depositEther() external payable {
//         require(msg.value > 0, "Must deposit more than 0");

//         // Update the user's balance and record the deposit time
//         users[msg.sender].balance += msg.value;
//         users[msg.sender].lastDepositTime = block.timestamp;

//         // Emit a deposit event
//         emit Deposit(msg.sender, msg.value);
//     }

//     function withdrawEther(uint256 _amount) external onlyAfterOneWeek(msg.sender) {
//         require(_amount > 0, "Withdraw amount must be greater than 0");
//         require(users[msg.sender].balance >= _amount, "Insufficient balance");

//         // Deduct the withdrawal amount from the user's balance
//         users[msg.sender].balance -= _amount;

//         // Transfer Ether back to the user
//         payable(msg.sender).transfer(_amount);

//         // Emit a withdrawal event
//         emit Withdrawal(msg.sender, _amount);
//     }

//     function balanceOf(address _user) external view returns (uint256) {
//         return users[_user].balance;
//     }

//     function lastDepositTimeOf(address _user) external view returns (uint256) {
//         return users[_user].lastDepositTime;
//     }
// }
