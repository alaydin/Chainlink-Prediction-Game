// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "hardhat/console.sol";

contract Prediction {
    AggregatorV3Interface internal priceFeed;

    event newBet(address indexed player, uint timestamp, uint amount, UpDown bet);
    event betResult(uint indexed timestamp, uint price);

    /**
     * Network: Goerli
     * Aggregator: ETH/USD
     * Address: 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
     */
    constructor() {
        priceFeed = AggregatorV3Interface(
            0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        );
    }

    struct Bet {
        address player;
        uint fees;
        uint prediction;
        uint resultPrice;
        uint betAmount;
        bool didWin;
        bool fulfilled;
        UpDown userBet;
    }

    enum UpDown {
        UP,
        DOWN
    }

    function predict(UpDown prediction, uint amount) external payable returns (uint) {
        
    }

    function getLatestPrice() public view returns (int) {
        // prettier-ignore
        (
            /* uint80 roundID */,
            int price,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = priceFeed.latestRoundData();
        return price;
    }
}
