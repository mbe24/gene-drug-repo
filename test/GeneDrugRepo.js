const GeneDrugRepo = artifacts.require("../contracts/GeneDrugRepo.sol");

const assert = require('assert');
const chai = require('chai');
const BN = require('bn.js');

chai.should();
chai.use(require('chai-bn')(BN));

contract("GeneDrugRepo", accounts => {

    it("should derive single key", async () => {
        const repo = await GeneDrugRepo.new();

        let expectedGeneName = "APOE"
        let expectedVariantNumber = "10";
        let expectedDrugName = "antipsychotics";

        let encoded = await repo.encodeKey(expectedGeneName, expectedVariantNumber, expectedDrugName);
        let keys = await repo.deriveKeys(encoded);

        ssert.equal(keys.length, 1);
    });

    it("should derive keys (wildcard on gene name)", async () => {
        const repo = await GeneDrugRepo.new();

        let expectedGeneName = "*"
        let expectedVariantNumber = "10";
        let expectedDrugName = "antipsychotics";

        let encoded = await repo.encodeKey(expectedGeneName, expectedVariantNumber, expectedDrugName);
        let keys = await repo.deriveKeys(encoded);

        assert.equal(keys.length, 127);
    });

    /*
    it("should derive keys (wildcard on variant number)", async () => {
        const repo = await GeneDrugRepo.new();
    });

    it("should derive keys (wildcard on drug name)", async () => {
        const repo = await GeneDrugRepo.new();
    });
    */

});