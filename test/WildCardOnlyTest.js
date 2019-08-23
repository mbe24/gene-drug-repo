const GeneDrugRepo = artifacts.require("../contracts/GeneDrugRepo.sol");

const assert = require('assert');
const chai = require('chai');
const BN = require('bn.js');

chai.should();
chai.use(require('chai-bn')(BN));

contract("GeneDrugRepo", accounts => {

    it("should perform query w/ wildcards only", async () => {
        const repo = await GeneDrugRepo.new();

        let expectedGeneName = "ABCB1"
        let expectedVariantNumber = "10";

        let drugs = ["antipsychotics", "antidepressants", "ataluren", "diazepam"];
        for (const drug of drugs) {
            await repo.insertObservation(
                expectedGeneName,
                parseInt(expectedVariantNumber),
                drug,
                "IMPROVED",
                true,
                true
                );
        }

        let relations = await repo.query("*", "*", "*");
        assert.equal(relations.length, drugs.length);
    });
    
    it("should perform existence check w/ wildcards only", async () => {
        const repo = await GeneDrugRepo.new();

        let expectedGeneName = "APOE"
        let expectedVariantNumber = "10";
        let expectedDrugName = "antipsychotics";

        await repo.insertObservation(
            expectedGeneName,
            parseInt(expectedVariantNumber),
            expectedDrugName,
            "IMPROVED",
            true, // suspectedRelation
            true // seriousSideEffect
        );

        let exists = await repo.entryExists("*", "*", "*");
        assert.equal(exists, true);
    });
    
});