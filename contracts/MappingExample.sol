pragma solidity ^0.5.13;

contract MappingExample {

    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddresMapping;
  
    function setValue(uint _index) public {
        myMapping[_index] = true;
    }

    function setMyAddressToTrue() public {
        myAddresMapping[msg.sender] = true;
    }
    
}