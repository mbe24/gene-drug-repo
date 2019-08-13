const GeneDrugRepo = artifacts.require("GeneDrugRepo");
const DataEncoder = artifacts.require("DataEncoder");

module.exports = function(deployer) {
  deployer.deploy(GeneDrugRepo);
  deployer.deploy(DataEncoder);
};