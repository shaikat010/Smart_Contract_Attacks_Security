// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract DOS {
    mapping(address => uint256) public balances;
   
    function deposit() public payable {
        require(msg.value>0);
        balances[msg.sender] += msg.value;
       
    }
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount);
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}


