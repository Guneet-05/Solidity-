pragma solidity ^0.8.13;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract Allowance {

    using SafeMath for uint;

    event AllowanceChanged(address indexed _forWho,address indexed _fromWhom,uint _oldAmount,uint _newAmount);
    
    address public owner;
    constructor() public {
       owner = msg.sender;
    }
    mapping (address => uint) public allowance;
   
    modifier onlyOwner() {
        require(owner == msg.sender,"You are not the owner");
        _;
    }

    function setAllowance(address _who, uint _amount) public onlyOwner {
        emit AllowanceChanged(_who,msg.sender,allowance[_who],_amount);
        allowance[_who] = _amount;
    }

    modifier ownerOrAllowed(uint _amount) {
       require(owner == msg.sender || allowance[msg.sender] >= _amount, "You are not allowed");
       _;
    }

    function reduceAllowance(address _who,uint _amount) internal {
        emit AllowanceChanged(_who,msg.sender,allowance[_who],allowance[_who].sub(_amount));
        allowance[_who]  = allowance[_who].sub(_amount);
    }

}
