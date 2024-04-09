//SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.0;

import"./PriceConvertor.sol";

error NotOwner();

contract Fundme   {
    using priceconvertor for uint256;
    uint256 public constant minimumusd = 50 * 1e10;  // making minimumusd as constant can reduce the gas price when executed.

    address[] public funders;
    mapping(address=>uint256) public addressoffunders;
    
    address public immutable owner; // making it gas efficient by making the variable immutable
    constructor() {
        owner = msg.sender;

    }

    function fund() public payable{
    require(msg.value.getconversionrate() >= minimumusd,"didn't send enough");
    funders.push(msg.sender);
    addressoffunders[msg.sender]=msg.value;

    }
    function withdraw() public onlyowner {
        
        /* for loop takes starting index, ending index, step value*/
        for(uint256 FunderIndex=0; FunderIndex< funders.length; FunderIndex++ ) {
            address funder = funders[FunderIndex];
            addressoffunders[funder]=0;

        }
        //resetting the array

        funders = new address[](0);
        //withdraw funds. It can be done in three ways transfer, send or call.

        //payable(msg.sender).transfer(address(this).balance);
        //bool
        //bool sendsuccess = payable(msg.sender).send(address(this).balance);
        //require(sendsuccess,"send failed");

        //call
        (bool callsuccess,)=payable(msg.sender).call{value:address(this).balance}("");
        require (callsuccess, "call failed");
    }
    modifier onlyowner{
            //require(msg.sender ==   owner,"sender is not owner");  
            /*it takes more gas than using revert stateme((nt*/
            if(msg.sender != owner) {revert NotOwner();}
            _;
        }
        //what happens if someone sends this contract ETH accidentally without calling fund function
        receive() external payable{
            fund();
        }

        fallback() external payable {
            fund();
        }

 
}