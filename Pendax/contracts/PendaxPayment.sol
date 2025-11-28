// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title PendaxPayment
 * @dev Simulates crypto payments for simple utility transactions
 */

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PendaxPayment is Ownable {
    address public acceptedToken; // ERC20 token used for payments
    mapping(address => uint256) public balances;

    event PaymentReceived(address indexed payer, uint256 amount, string reference);
    event Withdrawal(address indexed owner, uint256 amount);

    constructor(address _tokenAddress) {
        acceptedToken = _tokenAddress;
    }

    /**
     * @dev Make a payment using ERC20 token
     * @param amount Amount to pay
     * @param reference Description or reference for payment
     */
    function makePayment(uint256 amount, string calldata reference) external {
        require(amount > 0, "Amount must be greater than zero");
        IERC20(acceptedToken).transferFrom(msg.sender, address(this), amount);
        balances[msg.sender] += amount;
        emit PaymentReceived(msg.sender, amount, reference);
    }

    /**
     * @dev Withdraw funds by owner
     */
    function withdraw(uint256 amount) external onlyOwner {
        require(amount <= IERC20(acceptedToken).balanceOf(address(this)), "Insufficient balance");
        IERC20(acceptedToken).transfer(owner(), amount);
        emit Withdrawal(owner(), amount);
    }

    /**
     * @dev Update accepted ERC20 token
     */
    function updateToken(address newToken) external onlyOwner {
        acceptedToken = newToken;
    }
}

