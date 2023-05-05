// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "FREECODECAMP/PriceConverter.sol" ;
contract FundMe {
    using PriceConverter for uint256;
    uint256 public minimumUsd = 50 * 1e18;
    address[] public funders;
    mapping(address => uint256) public addresstoamountfunded;
     address public owner ;

    function Fund() public payable {
        require(msg.value.getConversionRate() >= minimumUsd , "Add more ether");
        funders.push(msg.sender);
        addresstoamountfunded[msg.sender] = msg.value;
    }
   function withdraw() public onlyOwner{
      for (uint256 fundersIndex =0 ; fundersIndex < funders.length ; fundersIndex++){
            address funders = funders[fundersIndex];
            addresstoamountfunded[funders] = 0;
      }
 
