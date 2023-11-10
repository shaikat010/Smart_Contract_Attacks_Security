// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract Phishable {
    address public owner;
    
    constructor (address _owner) {
        owner = _owner; 
    }
    
     receive() external payable{
       
     }
    function withdrawAll(address payable _recipient) public {
        require(tx.origin == owner);
        _recipient.transfer(address(this).balance); 
    }
}