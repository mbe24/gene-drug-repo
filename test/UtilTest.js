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

    it("should compute 1/3 in percent", async () => {
        const util = await Util.new();
        let percent = await util.fraction(1, 3);
        
        assert.equal(percent, "33.333333");
    });

    it("should compute 2/3 in percent", async () => {
        const util = await Util.new();
        let percent = await util.fraction(2, 3);
        
        assert.equal(percent, "66.666667");
    });

    it("should compute 3/2 in percent", async () => {
        const util = await Util.new();
        let percent = await util.fraction(3, 2);
        
        assert.equal(percent, "150.000000");
    });

    it("should compute 4/5 in percent", async () => {
        const util = await Util.new();
        let percent = await util.fraction(4, 5);
        
        assert.equal(percent, "80.000000");
    });

    it("should compute 4/3 in percent", async () => {
        const util = await Util.new();
        let percent = await util.fraction(4, 3);
        
        assert.equal(percent, "133.333333");
    });

    it("should compare two strings", async () => {
        const util = await Util.new();
        let equal = await util.strcmp("abc*", "abc*");
        
        assert.equal(equal, true);
    });

    it("should convert integer", async () => {
        const util = await Util.new();
        let i = await util.stoi("10");
        
        assert.equal(i, 10);
        assert.equal(i % 256, 10);
        assert.equal(i > 0x00, true);
        assert.equal(i < 0x64, true);
    });

});