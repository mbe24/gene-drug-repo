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

        await repo.insertObservation(
            expectedGeneName,
            10,
            expectedDrugName,
            "IMPROVED",
            true,
            true
        );

        let encoded = await repo.encodeKey(expectedGeneName, expectedVariantNumber, expectedDrugName);
        let keys = await repo.deriveKeys(encoded);

        assert.equal(keys.length, 1);
    });

    it("should derive keys (wildcard on gene name)", async () => {
        const repo = await GeneDrugRepo.new();

        let expectedGeneName = "*"
        let expectedVariantNumber = "10";
        let expectedDrugName = "antipsychotics";

        let genes = ["ABCB1", "ABCC4", "ABCG2", "ABL2", "ACE", "ADD1", "ADORA2A"];
        for (const gene of genes) {
            await repo.insertObservation(
                gene,
                10,
                expectedDrugName,
                "IMPROVED",
                true,
                true
                );
        }

        let encoded = await repo.encodeKey(expectedGeneName, expectedVariantNumber, expectedDrugName);
        let keys = await repo.deriveKeys(encoded);

        assert.equal(keys.length, genes.length);
    });

    it("should derive keys (wildcard on variant number)", async () => {
        const repo = await GeneDrugRepo.new();

        let expectedGeneName = "ABCB1"
        let expectedVariantNumber = "*";
        let expectedDrugName = "antipsychotics";

        let variants = [1, 2, 3, 5, 99, 98, 97];
        for (const variant of variants) {
            await repo.insertObservation(
                expectedGeneName,
                variant,
                expectedDrugName,
                "IMPROVED",
                true,
                true
                );
        }

        let encoded = await repo.encodeKey(expectedGeneName, expectedVariantNumber, expectedDrugName);
        let keys = await repo.deriveKeys(encoded);

        assert.equal(keys.length, variants.length);
    });  

    it("should derive keys (wildcard on drug name)", async () => {
        const repo = await GeneDrugRepo.new();

        let expectedGeneName = "ABCB1"
        let expectedVariantNumber = "10";
        let expectedDrugName = "*";

        let drugs = ["antipsychotics", "antidepressants", "ataluren", "diazepam"];
        for (const drug of drugs) {
            await repo.insertObservation(
                expectedGeneName,
                10,
                drug,
                "IMPROVED",
                true,
                true
                );
        }

        let encoded = await repo.encodeKey(expectedGeneName, expectedVariantNumber, expectedDrugName);
        let keys = await repo.deriveKeys(encoded);

        assert.equal(keys.length, drugs.length);
    });
});