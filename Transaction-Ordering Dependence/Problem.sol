// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;


contract TODExample {
    uint public balance;
    address public winner;
    
    function deposit() public payable {
        balance += msg.value;
        winner = msg.sender;
    }
    
    function withdraw(uint _amount) public {
        require(balance >= _amount, "Insufficient balance");
        require(msg.sender == winner, "You are not the winner");
        balance -= _amount;
        payable(msg.sender).transfer(_amount);
    }
}