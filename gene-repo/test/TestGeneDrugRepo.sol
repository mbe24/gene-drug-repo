pragma solidity >=0.4.21 <0.6.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/GeneDrugRepo.sol";

contract TestGeneDrugRepo {

    function testEncodeObject() public {
        GeneDrugRepo geneDrugRepo = GeneDrugRepo(DeployedAddresses.GeneDrugRepo());

        string memory expectedOutcome = "IMPROVED";
        bool expectedSuspectedRelation = false;
        bool expectedSeriousSideEffect = true;
        
        uint8 encoded = geneDrugRepo.encodeObject(expectedOutcome, expectedSuspectedRelation, expectedSeriousSideEffect);
        (string memory outcome, bool suspectedRelation, bool seriousSideEffect) = geneDrugRepo.decodeObject(encoded);
        
        Assert.equal(outcome, expectedOutcome, "It should return IMPROVED.");
        Assert.equal(seriousSideEffect, expectedSeriousSideEffect, "seriousSideEffect should return true.");
        Assert.equal(suspectedRelation, expectedSuspectedRelation, "suspectedRelation should return false.");
    }

}