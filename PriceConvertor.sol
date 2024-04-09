//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library priceconvertor {
      function getprice() internal view returns(uint256) {
        //ABI
        //Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface pricefeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int answer,,,) = pricefeed.latestRoundData();
        return uint256(answer*1e10);

    }
    function getversion() internal view returns(uint256){
        AggregatorV3Interface pricefeed= AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return pricefeed.version();
    }
    function getconversionrate(uint256 ethAmount) internal view returns (uint256) {
        uint256 ethprice = getprice();
        uint256 ethAmountinUSD = (ethAmount*ethprice) / 1e10;
        return ethAmountinUSD;


    }


}