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

  const intro = await FeedInstance.intro(token);
  const dec = await FeedInstance.decimals(token);
  const feedPrice = await FeedInstance.getPrice(token);

  console.table({
    Token: token,
    LP: intro.split("/")[0].trim(),
    Decimals: dec,
    Price_USD: feedPrice / 10 ** dec,
  });
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
