pragma solidity ^0.5.13;

contract WorkingWithVariables {
   uint256 public myUInt;

   function setMyUInt(uint _myUInt) public {
       myUInt = _myUInt;
   }  
   
   bool public myBoolean;

   function setMyBool(bool _myBoolean) public {
       myBoolean = _myBoolean;
   }

   uint8 public myUInt8;
   
   function incrementUInt() public{
       myUInt8++;
   }

   function decrementUint() public {
       myUInt8--;
   }

   address public myAddress;

   function setAddress(address _address) public{
        myAddress = _address;
   }
   
   function getBalanceOfAddress() public view returns(uint){ 
      return myAddress.balance;
   }

   string public myString;

   function setMyString(string memory _myString) public {
       myString = _myString;
   } 
}