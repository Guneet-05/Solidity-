pragma solidity ^0.5.13;

contract Owned {
   address owner;

   constructor () public {
      owner = msg.sender;
   }

   modifier onlyOwner() {
      require(owner == msg.sender, "You are not allowed");
      _;
   }
}