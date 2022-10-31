// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  const Feed = await hre.ethers.getContractFactory("Main");
  const FeedInstance = await Feed.deploy();
  await FeedInstance.deployed();

  const token = "0x6f259637dcd74c767781e37bc6133cd6a68aa161";
  const tokenInfo = await FeedInstance.getTokenInfo(token);

  console.table({
    Token: tokenInfo[0],
    LP: tokenInfo[1].split("/")[0].trim(),
    Decimals: tokenInfo[2],
    Price_USD: tokenInfo[3] / 10 ** tokenInfo[2],
  });
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
