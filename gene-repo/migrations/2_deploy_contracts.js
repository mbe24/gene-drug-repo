const GeneDrugRepo = artifacts.require("GeneDrugRepo");
const Encoder = artifacts.require("Encoder");

module.exports = function(deployer) {
  deployer.deploy(GeneDrugRepo);
  deployer.deploy(Encoder);
};