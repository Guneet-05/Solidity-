pragma solidity ^0.8.13;
import "./Allowance.sol";
contract SimpleWallet is Allowance {
    
    event MoneySent(address indexed _beneficiary,uint _amount);
    event MoneyRecieved(address indexed _from, uint _amount);

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

     function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount) {
        require(_amount <= address(this).balance, "Not sufficient funds in the smart contract");
        if(owner != msg.sender) {
            reduceAllowance(msg.sender,_amount);
        }
        emit MoneySent(_to,_amount);
         _to.transfer(_amount);
     }

     function recieveMoney() public payable {
        emit MoneySent(msg.sender,msg.value);
     }  
}