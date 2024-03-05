// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; // stating the solidity version

contract SimpleStorage {
            // dataypes
            // address , bytes, int, uint, String , boolean

            uint256 myWalletBalance;

            struct Person {
                uint256 walletBalance;
                string name;
            }

            // Dynamic array 
            Person[] public listOfPeople;

            //static array
            // Person[3] public listOfPeople1;

            //mohit => 232

            mapping(string => uint256) public nameToBalance;

            // Person public friendOne = Person(26, "Mohit");
            // Person public friendOne = Person({walletBalance: 26, name: "Mohit"});
            // Person public friendTwo = Person({walletBalance: 34, name: "Rohit"});
            // Person public friendThree = Person({walletBalance: 2236, name: "Kohit"});

            function credit(uint256 _myWalletBalance) public virtual{
                myWalletBalance = _myWalletBalance ;
            }

            function getWalletBalance() public view returns(uint256){
                return myWalletBalance;
            }

            // calldata , memory, storage
            function friendWalletBalance(uint256 _walletBalance, string memory _name) public {
                    listOfPeople.push(Person(_walletBalance, _name));
                    nameToBalance[_name] = _walletBalance;
            }
}

