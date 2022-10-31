pragma solidity 0.7.0;

interface RegistryInterface {
    function description(address token, address usd) external view returns (string memory);
    function getFeed(address token, address usd) external view returns (address);
    function decimals(address token, address usd) external view returns (uint8);
    function latestAnswer(address token, address usd) external view returns (int);
}
