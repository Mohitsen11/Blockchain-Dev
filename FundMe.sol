// Send eth by funders
// withdraw the amount by the owner
// minimum amount of eth to sent with this contract to deploy

// constants and immutable saves gases

// SPDX-License-Identifier: MIT

// 82,1776 without constant 
// 80,1830 with constant
// 77,8251 with constant and immutable

import {PriceConverter} from "./PriceConverter.sol";

pragma solidity ^0.8.18; // stating the solidity version and higher

contract FundMe {

    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 5e18;
    // 2,517 gas - non-constant
    // 417 gas - constant

    // we want to keep track of the funders who funded 
    address[] public funders;

    // mapping of funders with amountFunded
    mapping (address funder => uint256 amountFunded) public addressToAmountFunded;

    // Main function Send Eth
    function fund() public payable {
        require(msg.value.getConversionRate() > MINIMUM_USD, "Didnt send enough Eth");  //1e18 = 1 ETH = 1*10**18 wei
        //msg.value is in wei which has 18 decimals
        // it is in uint256 ( +ve )
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    address public immutable i_owner;
    // 2,536 gas non-immutable
    // 444 gas - immutable
 
    constructor(){
        i_owner = msg.sender;
    }

    // we want this withdraw function to only be called by the owner
    function withdraw() public onlyOwner{
        // amount of every funder must be zero(0)

        for(uint256 funderIndex=0; funderIndex<funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0; 
        }

        // reset the array
        funders = new address[](0);

        //now withdraw the funds
        // Solidity provides three methods to send Ether from one contract to another

        // transfer
        //msg.sender = type(address)
        // payabale(msg.sender) = type(payable address)
        // payable(msg.sender).transfer(address(this).balance);
        // send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send Failed");

        //call
        (bool callSuccess ,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call Failed");
    }

    modifier onlyOwner(){
        // first check who called this function 
        require(msg.sender == i_owner , "Sender is not the owner!");
        _;
    }

}