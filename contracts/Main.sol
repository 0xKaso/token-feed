pragma solidity 0.7.0;

import "./tools/Tool.sol";
import "./interface/Feed.sol";

contract Main is Tool, FeedInterface {
    // registry, USD
    constructor() Tool(0x47Fb2585D2C56Fe188D0E6ec628a38b74fCeeeDf, 0x0000000000000000000000000000000000000348) {}

    function getTokenInfo(address token)
        external
        view
        override
        returns (
            address,
            string memory,
            uint8,
            int
        )
    {
        return (token, _intro(token), _decimals(token), _getPrice(token));
    }
}
