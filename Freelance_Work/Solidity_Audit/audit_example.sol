// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title AuditExample
 * @dev Example smart contract used to demonstrate Solidity auditing skills
 */

contract AuditExample {
    mapping(address => uint256) public balances;

    event Deposit(address indexed user, uint256 amount);
    event Withdrawal(address indexed user, uint256 amount);

    // Deposit funds
    function deposit() external payable {
        require(msg.value > 0, "Deposit must be > 0");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    // Withdraw funds
    function withdraw(uint256 amount) external {
        require(amount <= balances[msg.sender], "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        emit Withdrawal(msg.sender, amount);
    }

    // Example function to check contract state
    function getBalance(address user) external view returns (uint256) {
        return balances[user];
    }
}

