const Encoder = artifacts.require("../contracts/Encoder.sol");

const assert = require('assert');
const chai = require('chai');
const BN = require('bn.js');

chai.should();
chai.use(require('chai-bn')(BN));

contract("Encoder", accounts => {

    it("should encode object data", async () => {
        const enc = await Encoder.new();

        let expectedOutcome = "IMPROVED";
        let expectedSuspectedRelation = false;
        let expectedSeriousSideEffect = true;
        
        let encoded = await enc.encodeData(expectedOutcome, expectedSuspectedRelation, expectedSeriousSideEffect);
        let ret = await enc.decodeData(encoded);

        let outcome =  ret[0];
        let suspectedRelation = ret[1];
        let seriousSideEffect = ret[2];

        assert.equal(outcome, expectedOutcome);
        assert.equal(suspectedRelation, expectedSuspectedRelation);
        assert.equal(seriousSideEffect, expectedSeriousSideEffect);
    });

    it("should encode key data", async () => {
        const enc = await Encoder.new();
        
        let expectedGeneName = "APOE"
        let expectedVariantNumber = "10";
        let expectedDrugName = "antipsychotics";

        let encoded = await enc.encodeKey(expectedGeneName, expectedVariantNumber, expectedDrugName);
        let ret = await enc.decodeKey(encoded);

        let geneName =  ret[0];
        let variantNumber = ret[1];
        let drugName = ret[2];

        assert.equal(geneName, expectedGeneName);
        assert.equal(variantNumber, expectedVariantNumber);
        assert.equal(drugName, expectedDrugName);
    });

});