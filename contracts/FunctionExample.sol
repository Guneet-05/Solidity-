pragma solidity ^0.5.13;

contract FunctionExample {
    mapping(address => uint) public balanceRecieved;
    address public owner;
   
    constructor () public {
       owner = msg.sender;  
    }

    // Writing functions can call all the functions i.e. view, public, writing all.
    function recieveMoney() public payable {
        assert(balanceRecieved[msg.sender] + msg.value >= balanceRecieved[msg.sender]);
        balanceRecieved[msg.sender] += msg.value;
    }

    // a view function is such a function that is juts for the purpose of returning 
    // it is not making any changes to the storage varaibles
    // a view function can call other view functions as well as pure functions
    // a view function cannot call a writing function
    function getOwner() public view returns(address) {
        return owner;
    }

    //pure function is a function that does not interact with any storage varraibles
    // class variables (data members) are called storage variables in solidity
    // a pure function can call another pure function
    // but a pure function cannot call a view function or even a writing function

    function convertWeiToEther(uint _amountInWei) public pure returns(uint) {
        return _amountInWei / 1 ether;
    }

    function withdrawMoney(address payable _to,uint _amount) public {
         require(_amount <= balanceRecieved[msg.sender] ,"insufficient funds");
         assert(balanceRecieved[msg.sender] - _amount <= balanceRecieved[msg.sender]);
         balanceRecieved[msg.sender] -= _amount;
         _to.transfer(_amount); 
    }

    function () external payable {
        recieveMoney();
    }
}