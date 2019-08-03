const GeneDrugRepo = artifacts.require("GeneDrugRepo");

module.exports = function(deployer) {
  deployer.deploy(GeneDrugRepo);
};