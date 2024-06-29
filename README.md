# DegenToken

DegenToken is an ERC20 token contract written in Solidity. It includes functionalities for token minting, managing an in-game store, allowing users to purchase items, and tracking item ownership.

## Features

- **Minting Tokens**: Only the owner can mint new tokens.
- **In-Game Store**: Users can purchase items from the in-game store using tokens.
- **Item Ownership**: Track which items users have purchased.

## Installation and Setup

To deploy and interact with the DegenToken contract, follow these steps:

### Prerequisites

- Node.js (version 14 or later)
- npm (version 6 or later)
- Solidity compiler (version 0.8 or later)
- Ganache or other blockchain network for testing

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/degen-token.git
   ```

2. Navigate to the project directory:

   ```bash
   cd degen-token
   ```

3. Install dependencies:

   ```bash
   npm install
   ```

### Deployment

1. Compile the smart contract:

   ```bash
   solcjs --bin --abi contracts/DegenToken.sol -o ./build
   ```

2. Deploy the contract to a blockchain network (e.g., Ganache, Ropsten, Mainnet).

3. Update `myContract.js` with the deployed contract address and ABI.

### Usage

1. Start the application:

   ```bash
   npm start
   ```

2. Open a web browser and navigate to `http://localhost:3000`.

### Features

- **Add Item**: Add a new item to the in-game store.
  
  ```solidity
  function addItem(uint256 itemId, string memory name, uint256 price) public onlyOwner
  ```

- **Purchase Item**: Purchase an item from the in-game store.
  
  ```solidity
  function purchaseItem(uint256 itemId) public
  ```

- **Check Item Ownership**: Check if a user has purchased an item.
  
  ```solidity
  function hasPurchasedItem(address user, uint256 itemId) public view returns (bool)
  ```

### License

This project is licensed under the MIT License. 
### Contributing

Contributions are welcome! Please fork this repository and open a pull request to propose changes or fixes.

### Acknowledgments

- This project was inspired by the Web3.js documentation and the Solidity documentation.
