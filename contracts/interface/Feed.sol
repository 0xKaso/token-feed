pragma solidity 0.7.0;
pragma experimental ABIEncoderV2;

interface FeedInterface {
    struct TokenInfo {
        address token;
        string tokenLP;
        uint8 decimals;
        int price;
    }

    function getTokenInfo(address token) external view returns (TokenInfo memory);
}
