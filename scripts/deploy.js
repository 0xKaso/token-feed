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

  const addr = [
    "0xc770eefad204b5180df6a14ee197d99d808ee52d",
    "0x0000000000000000000000000000000000000348" //USD, DO NOT CHANGE
  ];

  const intro = await FeedInstance.intro(...addr);
  const dec = await FeedInstance.decimals(...addr);
  const feedAddress = await FeedInstance.getFeed(...addr);
  const feedPrice = await FeedInstance.getPrice(...addr);

  console.log(`deployed to ${FeedInstance.address}`);
  console.log("intro ", intro);
  console.log("feedAddress ", feedAddress);
  console.log("feedPrice ", feedPrice / 10 ** dec);
  console.log("dec", dec);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
