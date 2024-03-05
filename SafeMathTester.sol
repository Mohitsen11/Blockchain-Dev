// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

contract SafeMathTester{
        uint8 public myValue = 255;

        function add() public {
            unchecked { myValue += 1;} 
        }
}

// use unchecked (^0.8.0)  to avoid the reverts occurs due to underflow/overflow