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
    address registryFactory = 0x47Fb2585D2C56Fe188D0E6ec628a38b74fCeeeDf;
    Registry RegistryFactory = Registry(registryFactory);

    function getFeed(address tokenA, address tokenB)
        public
        view
        returns (address)
    {
        return RegistryFactory.getFeed(tokenA, tokenB);
    }

    function getPrice(address tokenA, address tokenB)
        external
        view
        returns (int256)
    {
        return RegistryFactory.latestAnswer(tokenA, tokenB);
    }

    function intro(address tokenA, address tokenB)
        external
        view
        returns (string memory)
    {
        return RegistryFactory.description(tokenA, tokenB);
    }

    function decimals(address tokenA, address tokenB)
        external
        view
        returns (uint8)
    {
        return RegistryFactory.decimals(tokenA, tokenB);
    }
}
