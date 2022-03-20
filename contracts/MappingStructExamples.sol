pragma solidity ^0.5.13;

contract MappingStructExamples {

    struct Payment {
        uint amount;
        uint timestamps;
    }

    struct Balance {
        uint totalBalance;
        uint numPayments;
        mapping(uint => Payment) payments;  
    }

    mapping(address => Balance) public balanceRecieved;

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function sendMoney() public payable {
        balanceRecieved[msg.sender].totalBalance += msg.value;
        Payment memory payment  = Payment(msg.value,now);
        balanceRecieved[msg.sender].payments[balanceRecieved[msg.sender].numPayments] = payment;
        balanceRecieved[msg.sender].numPayments++;
    } 

    function withdrawMoney(address payable _to, uint _amount) public {
       //check whether account has enough balance to send
       require(balanceRecieved[msg.sender].totalBalance >= _amount,"not enough funds");
       balanceRecieved[msg.sender].totalBalance -= _amount;
       _to.transfer(_amount);
    }

    //transfers all the money in the smart contract to the _to account
    function withdrawAllMoney(address payable _to) public {
        uint balanceToSend = balanceRecieved[msg.sender].totalBalance;
        balanceRecieved[msg.sender].totalBalance = 0;
        _to.transfer(balanceToSend);    
    }
}