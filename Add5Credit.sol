// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import { SimpleStorage } from "./SimpleStorage.sol";

contract Add5Credit is SimpleStorage{

    // override the credit function to update the given credit balance increased by 5;
    // use override keyword

    function credit(uint256 _walletBalance) public override {
        myWalletBalance = _walletBalance + 5;
    }
    
}