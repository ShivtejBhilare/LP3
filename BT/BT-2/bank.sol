// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bank {
    mapping(address => uint) private balances;

    // Event for Deposit
    event Deposit(address indexed account, uint amount);

    // Event for Withdraw
    event Withdraw(address indexed account, uint amount);

    // Function to deposit money
    function deposit() external payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    // Function to withdraw money
    function withdraw(uint _amount) external {
        require(_amount <= balances[msg.sender], "Insufficient balance");
        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
        emit Withdraw(msg.sender, _amount);
    }

    // Function to show balance in Ether
    function getBalanceInEther() external view returns (uint) {
        return balances[msg.sender] / 1 ether;
    }

    // Function to show balance in Wei
    function getBalanceInWei() external view returns (uint) {
        return balances[msg.sender];
    }

    // Fallback function to handle ether sent directly to the contract
    fallback() external payable {}

    // Receive function to handle plain ether transfers
    receive() external payable {}
}
