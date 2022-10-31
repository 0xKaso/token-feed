require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.7.0",
  networks:{
    hardhat: {
      forking: {
        url: "https://eth-rpc.gateway.pokt.network",
      }
    },
  }
};
