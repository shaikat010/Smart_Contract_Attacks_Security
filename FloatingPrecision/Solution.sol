//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0 <0.9.0;
//1 ETH= 10^18 Wei
 contract FoatingIssue {
    uint constant public tokensPerEth = 10 * 1e18; //1 ETH = 100 * 10^18 
    uint constant public weiPerEth = 1e18;//1 ETH= 10^18 Wei
    mapping(address => uint) public balances;
    function buyTokens() public payable {
        uint tokens = msg.value*tokensPerEth/weiPerEth;
        balances[msg.sender] += tokens; 
    }
    //msg.value>weiPerEth = Fraction >1
    //msg.value<weiPerEth = Fraction <1 = decimal
    //0.5 ETH / 1 ETH = 0.5

    //Conclusion - Numerator should be always in integer , tokens integer
    function sellTokens(uint tokens) public {
        require(balances[msg.sender] >= tokens);
        uint eth = tokens/tokensPerEth; 
        balances[msg.sender] -= tokens;
        payable(msg.sender).transfer(eth*weiPerEth); //
    }
}


