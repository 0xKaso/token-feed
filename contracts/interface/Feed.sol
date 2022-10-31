pragma solidity 0.7.0;

interface FeedInterface {
    function getTokenInfo(address token)
        external
        view
        returns (
            address,
            string memory,
            uint8,
            int
        );
}
