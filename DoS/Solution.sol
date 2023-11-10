// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;


contract DOS {
    mapping(address => uint256) public balances;
    mapping(address=>uint) public reputation;
    uint constant public REPUTATION_THRESHOLD = 10;
    function deposit() public payable {
        require(msg.value>= 1 ether || (msg.value>0 && reputation[msg.sender]<=100),"Not acceptable");
        balances[msg.sender] += msg.value;
        reputation[msg.sender]++;
    }
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount && reputation[msg.sender]>=REPUTATION_THRESHOLD);
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}


