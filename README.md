

---

# MyToken - ERC-20 Token Smart Contract

### Overview

**MyToken** is an ERC-20 token implemented using OpenZeppelin's standard libraries. This smart contract allows for minting, burning, transferring tokens, and approving allowances. The contract is built using Solidity and can be deployed on the Ethereum network using tools like **HardHat** or **Remix**.

### Features

- **Minting Tokens**: The contract owner can mint new tokens to any address.
- **Burning Tokens**: Any user can burn their own tokens to reduce the total supply.
- **Transfer Tokens**: Users can transfer tokens to other addresses.
- **Transfer Tokens on Behalf**: Allows users to transfer tokens from another address using the approved allowance.
- **Allowance System**: Users can approve a spender to use a specific amount of their tokens, and spenders can check their allowed balance.
- **Balance Checking**: Users can check their own balance or any other user's balance.
  
### Contract Functions

1. **Constructor**: 
   - Initializes the token with a name (`MyToken`), symbol (`MTK`), and an initial supply that is assigned to the owner.

2. **Mint Tokens**:
   - `mintTokens(address to, uint256 amount)`  
     Callable only by the contract owner to mint new tokens to the specified address.

3. **Burn Tokens**:
   - `burnTokens(uint256 amount)`  
     Any user can burn their own tokens to reduce the total supply.

4. **Transfer Tokens**:
   - `transferTokens(address to, uint256 amount)`  
     Allows the user to transfer tokens from their own balance to another address.

5. **Transfer Tokens on Behalf**:
   - `transferTokensFrom(address from, address to, uint256 amount)`  
     Allows a spender to transfer tokens from one address to another using the allowance approved by the owner.

6. **Approve Spender**:
   - `approveSpender(address spender, uint256 amount)`  
     Approves the specified spender to spend a certain amount of tokens on behalf of the token holder.

7. **Check Allowance**:
   - `checkAllowance(address owner, address spender)`  
     Returns the number of tokens the spender is allowed to use on behalf of the token owner.

8. **Check Balance**:
   - `checkBalance(address account)`  
     Returns the balance of the specified address.

### Getting Started

#### Prerequisites
1. **Solidity**: Smart contracts are written in Solidity (version ^0.8.9).
2. **HardHat** or **Remix**: You can deploy the contract using either of these development environments.
3. **MetaMask**: An Ethereum wallet (like MetaMask) will be needed to interact with the deployed contract.

#### Installation and Deployment

1. **Clone the repository**:
   ```bash
   git clone <your-repository-url>
   cd your-repository-directory
   ```

2. **Install dependencies** (for HardHat):
   ```bash
   npm install @openzeppelin/contracts
   ```

3. **Compile the contract**:
   ```bash
   npx hardhat compile
   ```

4. **Deploy the contract** (on HardHat or a test network):
   ```bash
   npx hardhat run scripts/deploy.js --network <network-name>
   ```

5. **Interact with the contract** using Remix or HardHat scripts.

#### Example Deployment Script

For HardHat, here's a sample script to deploy the contract:

```javascript
async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contracts with the account:", deployer.address);

    const initialSupply = ethers.utils.parseUnits("1000", 18); // 1000 tokens
    const MyToken = await ethers.getContractFactory("MyToken");
    const token = await MyToken.deploy(initialSupply);

    console.log("MyToken deployed to:", token.address);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
```

### Contract Deployment

To deploy the contract on a testnet (e.g., Goerli), you'll need to:

1. Set up the network configuration in `hardhat.config.js`.
2. Add your wallet private key and Infura/Alchemy API key in the `.env` file.
3. Deploy the contract using the `npx hardhat run` command and specifying the network.

### Usage

1. **Mint Tokens**:
   - The owner can mint tokens to any address by calling `mintTokens(address to, uint256 amount)`.
   
2. **Burn Tokens**:
   - Users can call `burnTokens(uint256 amount)` to burn their own tokens.

3. **Transfer Tokens**:
   - Users can call `transferTokens(address to, uint256 amount)` to send tokens to another address.

4. **Approve Spender**:
   - A user can call `approveSpender(address spender, uint256 amount)` to allow another address to spend tokens on their behalf.

5. **Transfer Tokens From**:
   - A spender can transfer tokens on behalf of an owner by calling `transferTokensFrom(address from, address to, uint256 amount)`.

### License

This project is licensed under the MIT License.

---

Let me know if you need further clarification or modifications!
