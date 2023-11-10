pragma solidity ^0.8.0;

//In this updated version, users can claim a reward only after 
//the claimBlock block number has been reached. 
//Since block numbers cannot be manipulated by attackers,
// this smart contract is not vulnerable to time dependence attacks.
contract TimeDependenceExample {
    uint public reward;
    uint public claimBlock;
    
    function setReward(uint _reward) public {
        reward = _reward;
    }
    
    function claimReward() public {
        require(block.number >= claimBlock, "Reward not available yet"); //replaced with block.number
        require(reward > 0, "No reward available");
        
        payable(msg.sender).transfer(reward);
        reward = 0;
    }
}
