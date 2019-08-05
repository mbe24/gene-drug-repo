pragma solidity >=0.4.21 <0.6.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/GeneDrugRepo.sol";

contract TestGeneDrugRepo {

    function test() public {
        GeneDrugRepo geneDrugRepo = GeneDrugRepo(DeployedAddresses.GeneDrugRepo());

        bool expected = false;
        Assert.equal(geneDrugRepo.entryExists("*", "*", "*"), expected, "It should return false.");
    }

}