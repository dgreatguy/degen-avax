const hre = require("hardhat");

async function main() {
  // Get the Degen smart contract
  const Degen = await hre.ethers.getContractFactory("Degen");

  // Deploy it
  const degen = await Degen.deploy();
  await degen.waitForDeployment();

  // Display the contract address
  console.log(`degen token deployed to ${degen.target}`);
  // 0x5c517115c6c41E5dAFcdCB64ad73BC0e1872cE49
}

// Hardhat recommends this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});