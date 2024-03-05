// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18; 

// Named import
import { SimpleStorage } from "./SimpleStorage.sol";

contract StorageFactory{

    SimpleStorage[] public mySimpleStorageList; // declared the object(variable) of type SimpleStorage(contract)

    // creates a function for deploying simple storage contracts form here
    function createSimpleStorageContracts() public {
        SimpleStorage mySimpleStorage = new SimpleStorage(); // initialized the new SimpleStorage contract (object initialization)
        mySimpleStorageList.push(mySimpleStorage);
    }

    // manage the simpleStorage contract's function like credit , getWalletBalance
    // address
    // ABI :- Application Binary Interface
    function sfCredit(uint256 _SimpleStorageIndex, uint256 _SimpleStorageWalletBalance) public {
        mySimpleStorageList[_SimpleStorageIndex].credit(_SimpleStorageWalletBalance);
    }

    function sfGetWalletBalance(uint256 _SimpleStorageIndex) public view returns(uint256){
        return mySimpleStorageList[_SimpleStorageIndex].getWalletBalance();
    }

}