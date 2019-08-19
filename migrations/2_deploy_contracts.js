const GeneDrugRepo = artifacts.require("GeneDrugRepo");
const Encoder = artifacts.require("Encoder");
const Util = artifacts.require("Util");

module.exports = function(deployer) {
  deployer.deploy(Util);
  deployer.link(Util, GeneDrugRepo);
  deployer.deploy(Encoder);
  deployer.deploy(GeneDrugRepo);
};