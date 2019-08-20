const Util = artifacts.require("../contracts/Util.sol");

const assert = require('assert');
const chai = require('chai');
const BN = require('bn.js');

chai.should();
chai.use(require('chai-bn')(BN));

contract("Util", accounts => {

    it("should test 1st bit positive", async () => {
        const util = await Util.new();
        let isSet = await util.testBit(16, 4);

        assert.equal(isSet, true);
    });

    it("should test 3rd bit positive", async () => {
        const util = await Util.new();
        let isSet = await util.testBit(15, 3);
        
        assert.equal(isSet, true);
    });

    it("should test 3rd bit negative", async () => {
        const util = await Util.new();
        let isSet = await util.testBit(11, 2);
        
        assert.equal(isSet, false);
    });

});