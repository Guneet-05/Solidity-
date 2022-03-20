pragma solidity ^0.5.13;

contract StartStopUpdate {
   
   address owner;
   bool public paused;

   constructor() public {
      owner = msg.sender;
   }
 
   function setPaused(bool _paused) public {
       require(msg.sender == owner,"you cannot pause as you are not the owner");
       paused = _paused;
   }

   function sendMoney() public payable {
      
   }

   function withdrawAllMoney(address payable _to) public {
       require(msg.sender == owner,"you are not the owner");
       require(!paused,"can't withdraw the money as the contract is paused");
       _to.transfer(address(this).balance);
   }

   function destroySmartContract(address payable _to) public {
       require(msg.sender == owner, "self destruction can be done only by the owner");
       selfdestruct(_to);
   }
}