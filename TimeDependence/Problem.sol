// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract TimeDependence {
  address winner;
  function winnerCheck(uint value) external {
    if (value == block.timestamp%2) 
    {
      winner=msg.sender;
    }
  }
}
