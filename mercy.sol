// SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.0;

// Todolist

contract tech4dev{

// declaring a structure
 
    struct micro{
 string title;
 bool completed;
   
    }
// declaring a struct object

micro[]public tech;

//define a function to set values

function insert (string memory _title) public {
    tech.push(micro(_title, false));
}
 
 function update (uint index, string memory _title)public{
  
  tech[index] .title =  _title;
 }

}