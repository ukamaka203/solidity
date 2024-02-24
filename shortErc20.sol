// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract MyToken is ERC20, ERC20Burnable, Ownable{
constructor(address initialOwner)
ERC20("MYToken", "MTK")
Ownable(initialOwner)
{}

function mint(address to, uint256 amount) public onlyOwner{
    _mint(to,amount);
}

}
