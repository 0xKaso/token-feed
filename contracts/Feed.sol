pragma solidity ^0.8.12;

interface Registry {
    function description(address tokenA,address tokenB) external view returns(string memory);
    function getFeed(address tokenA,address tokenB) external view returns(Aggregator);
}

interface Aggregator {
    function latestAnswer() external view returns(uint); 
}

contract Main {
    address registryFactory = 0x47Fb2585D2C56Fe188D0E6ec628a38b74fCeeeDf;
    Registry RegistryFactory = Registry(registryFactory);

    function getFeed(address tokenA, address tokenB) external view returns(Aggregator){
        return RegistryFactory.getFeed(tokenA,tokenB);
    }

    function getPrice(address tokenA, address tokenB) external view returns(uint){
        return this.getFeed(tokenA, tokenB).latestAnswer();
    }
}