//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0 <0.9.0;


 contract FoatingIssue {
    uint constant public tokensPerEth = 10; 
    uint constant public weiPerEth = 1e18;
    mapping(address => uint) public balances;
    function buyTokens() public payable {
        uint tokens = msg.value/weiPerEth*tokensPerEth; // convert wei to eth, then multiply by token rate
        balances[msg.sender] += tokens; 
    }
    
    function sellTokens(uint tokens) public {
        require(balances[msg.sender] >= tokens);
        uint eth = tokens/tokensPerEth; 
        balances[msg.sender] -= tokens;
        payable(msg.sender).transfer(eth*weiPerEth); //
    }
}


