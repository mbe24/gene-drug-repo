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
            parseInt(expectedVariantNumber),
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
                parseInt(expectedVariantNumber),
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
                parseInt(expectedVariantNumber),
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

    it("should derive single key", async () => {
        const repo = await GeneDrugRepo.new();

        let expectedGeneName = "APOE"
        let expectedVariantNumber = "10";
        let expectedDrugName = "antipsychotics";

        await repo.insertObservation(
            expectedGeneName,
            parseInt(expectedVariantNumber),
            expectedDrugName,
            "IMPROVED",
            true,
            true
        );

        let encoded = await repo.encodeKey(expectedGeneName, expectedVariantNumber, expectedDrugName);
        let keys = await repo.deriveKeys(encoded);

        assert.equal(keys.length, 1);
    });

    it("should perform query w/ single key", async () => {
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

        await repo.insertObservation(
            expectedGeneName,
            parseInt(expectedVariantNumber),
            expectedDrugName,
            "DETERIORATED",
            true,
            false
        );

        await repo.insertObservation(
            expectedGeneName,
            parseInt(expectedVariantNumber),
            expectedDrugName,
            "UNCHANGED",
            false,
            false
        );

        let relations = await repo.query(expectedGeneName, expectedVariantNumber, expectedDrugName);
        assert.equal(relations.length, 1);

        let relation = relations[0];
        let attribute = 0;

        assert.equal(relation[attribute++], expectedGeneName); // geneName
        assert.equal(relation[attribute++], parseInt(expectedVariantNumber)); // variantNumber
        assert.equal(relation[attribute++], expectedDrugName); // drugName
        assert.equal(relation[attribute++], 3); // totalCount
        assert.equal(relation[attribute++], 1); // improvedCount
        assert.equal(relation[attribute++], "33.333333"); // improvedPercent
        assert.equal(relation[attribute++], 1); // unchangedCount
        assert.equal(relation[attribute++], "33.333333"); // unchangedPercent
        assert.equal(relation[attribute++], 1); // deterioratedCount
        assert.equal(relation[attribute++], "33.333333"); // deterioratedPercent
        assert.equal(relation[attribute++], 2); // suspectedRelationCount
        assert.equal(relation[attribute++], "66.666667"); // suspectedRelationPercent
        assert.equal(relation[attribute++], 1); // sideEffectCount
        assert.equal(relation[attribute++], "33.333333"); // sideEffectPercent
    });

    it("should perform query w/ wildcard key", async () => {
        const repo = await GeneDrugRepo.new();

        let expectedGeneName = "ABCB1"
        let expectedVariantNumber = "10";
        let expectedDrugName = "*";

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

        let relations = await repo.query(expectedGeneName, expectedVariantNumber, expectedDrugName);
        assert.equal(relations.length, drugs.length);
    });

    it("should perform existence check w/ single key", async () => {
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

        let exists = await repo.entryExists(expectedGeneName, expectedVariantNumber, expectedDrugName);
        assert.equal(exists, true);
    });

    it("should retrieve all set keys", async () => {
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
        let keys = await repo.retrieveKeys();
        assert.equal(keys.length, drugs.length);
    });

});