pragma solidity >=0.4.21 <0.6.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/DataEncoder.sol";
//import "../contracts/GeneDrugRepo.sol";

contract DataEncoderTest {

    function testEncodeObject() public {
        DataEncoder encoder = DataEncoder(DeployedAddresses.DataEncoder());

        string memory expectedOutcome = "IMPROVED";
        bool expectedSuspectedRelation = false;
        bool expectedSeriousSideEffect = true;
        
        uint8 encoded = encoder.encodeData(expectedOutcome, expectedSuspectedRelation, expectedSeriousSideEffect);
        (string memory outcome, bool suspectedRelation, bool seriousSideEffect) = encoder.decodeData(encoded);
        
        Assert.equal(outcome, expectedOutcome, "It should return IMPROVED.");
        Assert.equal(seriousSideEffect, expectedSeriousSideEffect, "seriousSideEffect should return true.");
        Assert.equal(suspectedRelation, expectedSuspectedRelation, "suspectedRelation should return false.");
    }

}