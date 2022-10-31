pragma solidity 0.7.0;

interface Registry {
    function description(address base, address quote)
        external
        view
        returns (string memory);

    function getFeed(address tokenA, address tokenB)
        external
        view
        returns (address);

    function decimals(address tokenA, address tokenB)
        external
        view
        returns (uint8);

    function latestAnswer(address tokenA, address tokenB)
        external
        view
        returns (int256);
}

contract Main {
    // config
    address USD;
    Registry RegistryFactory;

    constructor() {
        USD = 0x0000000000000000000000000000000000000348; // usd
        address registryFactory = 0x47Fb2585D2C56Fe188D0E6ec628a38b74fCeeeDf; // chainlink registry
        RegistryFactory = Registry(registryFactory);
    }

    function intro(address tokenA) external view returns (string memory) {
        return RegistryFactory.description(tokenA, USD);
    }

    function decimals(address tokenA) external view returns (uint8) {
        return RegistryFactory.decimals(tokenA, USD);
    }

    function getPrice(address tokenA) external view returns (int256) {
        return RegistryFactory.latestAnswer(tokenA, USD);
    }
}
