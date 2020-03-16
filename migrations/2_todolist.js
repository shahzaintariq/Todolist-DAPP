const Migrations = artifacts.require("todolist");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
};
