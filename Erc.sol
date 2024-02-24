
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 //commented erc20
interface IERC20 {
    function totalSupply() external view returns (uint);
    function balanceOf(address account) external view returns (uint);
    function transfer(address recipient, uint amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint);
    function approve(address spender, uint amount) external returns (bool);
    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}
 
contract ERC20 is IERC20 {
  uint public override totalSupply;
  mapping(address => uint) public override balanceOf;
//mapping(address => mapping(address => uint)) public override allowance;
 
mapping(address => mapping(address => uint)) public override allowance;
 
string public name ="MIKE TOKEN";
string public symbol ="MTK";
uint public decimal = 18;
 
function transfer(address recepient, uint amount)
external override returns(bool) {
balanceOf[msg.sender] -= amount;
//balanceOf[msg.sender] = balanceOf[msg.sender] - amount;
 
balanceOf[recepient] += amount;
//balanceOf[msg.sender] = balanceOf[recepient] + amount;
 
emit Transfer(msg.sender,recepient,amount);
return true;
}
 
function approve(address spender,uint amount)
external override returns(bool){
    //line 45 allows the spender to send a particular amount
allowance[msg.sender][spender] = amount;
//Inform the frontend
emit Approval(msg.sender,spender,amount);
return true;
}
 
function transferFrom(address sender,address recepient,uint amount)
external override returns(bool){
    //Remember, this transferFrom function will be called by the
    //recepient
  //deduct the allowance you were given
allowance[sender][msg.sender] -= amount;
//remove the amount from the sender's account(Your husband)
 balanceOf[sender] -= amount;
 //credit the recepient with the amount deducted above
 balanceOf[recepient] += amount;
 //Let the frontend knows that a transaction has occured.
 emit Transfer(sender, recepient, amount);
return true;
}
 
function mint(uint amount) external {
    //Line 67 will add money to the msg.sender
//balanceOf[msg.sender] += amount;
balanceOf[msg.sender] = balanceOf[msg.sender] + amount;
 
//line 71 is adding the amount to the total supply which
//is the total money in circulation
//totalSupply += amount;
totalSupply = totalSupply + amount;
//You need to let the frontend know what is going on
//that the money is from address zero which is unknown
emit Transfer(address(0), msg.sender, amount);
}
 
function burn(uint amount) external {
    //Burn will destroy the token, so line 80
    //will remove the amount from msg.sender
   balanceOf[msg.sender] -= amount;
 
   //line 82 will deduct the amount from the total supply
    totalSupply -= amount;
    emit Transfer(msg.sender, address(0), amount);
}
}
 