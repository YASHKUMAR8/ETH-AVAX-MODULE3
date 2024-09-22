// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// Importing OpenZeppelin's ERC20 and Ownable contract
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Degentoken is ERC20, Ownable {
    // Constructor to initialize the token with a name, symbol, and initial supply
    constructor(uint _initialSupply) ERC20("MyToken", "MTK") Ownable(msg.sender) {
        _mint(msg.sender, _initialSupply * (10 ** decimals()));  // Mint initial supply to contract owner
    }

    // Mint new tokens, callable only by the owner
    function mintTokens(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Burn tokens, callable by any user for their own tokens
    function burnTokens(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // Function to check balance of a specific address
    function checkBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }

    // Transfer tokens from the sender (msg.sender) to another address
    function transferTokens(address to, uint256 amount) public {
        _transfer(msg.sender, to, amount);  // Standard ERC20 transfer function
    }

    // Transfer tokens from one address to another using allowance
    function transferTokensFrom(address from, address to, uint256 amount) public {
        uint256 currentAllowance = allowance(from, msg.sender);  // Check the allowance
        require(currentAllowance >= amount, "Transfer amount exceeds allowance");
        
        _approve(from, msg.sender, currentAllowance - amount);  // Decrease the allowance
        _transfer(from, to, amount);  // Transfer the tokens
    }

    // Function to approve a spender to spend tokens on behalf of the user
    function approveSpender(address spender, uint256 amount) public {
        _approve(msg.sender, spender, amount);  // Standard ERC20 approve function
    }

    // Function to check the allowance a spender has on behalf of an owner
    function checkAllowance(address owner, address spender) public view returns (uint256) {
        return allowance(owner, spender);  // Standard ERC20 allowance function
    }
}
