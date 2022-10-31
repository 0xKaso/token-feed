pragma solidity 0.7.0;

import "../interface/Registry.sol";

contract Tool {
    address USD;
    RegistryInterface RegistryFactory;

    constructor(address _registryFactory, address _USD) {
        USD = _USD; // usd
        RegistryFactory = RegistryInterface(_registryFactory);
    }

    function _intro(address token) internal view returns (string memory) {
        return RegistryFactory.description(token, USD);
    }

    function _decimals(address token) internal view returns (uint8) {
        return RegistryFactory.decimals(token, USD);
    }

    function _getPrice(address token) internal view returns (int) {
        return RegistryFactory.latestAnswer(token, USD);
    }
}
