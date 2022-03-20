pragma solidity ^0.5.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/math/SafeMath.sol";

contract LibrariesExamples {
    mapping(address => uint) public tokenBalance;

    constructor() public {
       tokenBalance[msg.sender] = 1;
    }

    function sendToken(address _to, uint _amount) public returns(bool) {
       tokenBalance[msg.sender] -= _amount;
       tokenBalance[_to] += _amount;

       return true;
    }
}