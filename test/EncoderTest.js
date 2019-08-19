const Encoder = artifacts.require("../contracts/Encoder.sol");

const chai = require('chai');
const BN = require('bn.js');

chai.should();
chai.use(require('chai-bn')(BN));

contract("Encoder", accounts => {

    it("add new entry", async () => {
        const Enc = await Encoder.new();

        //Check if repo is empty
        //let actualVal = await GDR.getNumObservations();
        //actualVal.should.be.a.bignumber.that.equals("0");

        //await GDR.insertObservation("geneName", 256, "drugName", "outcome", true, false);

        //actualVal = await GDR.getNumObservations();
        //actualVal.should.be.a.bignumber.that.equals("1");
    });

});

