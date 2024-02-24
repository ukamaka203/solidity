// SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.0;
contract Olivia{
    address public owner;
    constructor(){
        owner = msg.sender;
    }
 modifier onlyowner(){
    require (msg.sender ==owner, "you are not the owner");
    _;
 }
function setOwner(address _newOnwer) public onlyowner{
require(_newOnwer!= address(0), "invalid address");
 owner = _newOnwer;
}

 function onlyownercancall() public onlyowner {

}
 
 function anyonecancall()public{

 }
}