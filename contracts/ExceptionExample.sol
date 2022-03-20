pragma solidity ^0.5.13;

contract ExceptionExample.sol {
    mapping(address => uint64) balanceRecieved;

    function recieveMoney() public payable {
        assert(balanceRecieved[msg.sender] + uint64(msg.value) >= balanceRecieved[msg.sender]);
        balanceRecieved[msg.sender] += uint64(msg.value);
    }

    function withdrawMoney(address payable _to, uint64 _amount) public {
        require(_amount <= balanceRecieved[msg.sender],"insufficient funds");
        assert(balanceRecieved[msg.sender] >= balanceRecieved[msg.sender] - _amount);
        balanceRecieved[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}