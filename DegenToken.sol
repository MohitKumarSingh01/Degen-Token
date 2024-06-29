// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {}

    // Minting new tokens, only the owner can mint
    function mintTokens(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Structure to represent an item in the in-game store
    struct Item {
        string name;
        uint256 price;
    }

    // Mapping to store available items in the in-game store
    mapping(uint256 => Item) public items;

    // Mapping to track which items a user has bought
    mapping(address => mapping(uint256 => bool)) public userItems;

    // Event to log item purchases
    event ItemPurchased(address indexed user, uint256 itemId, string itemName);

    // Add a new item to the in-game store
    function addItem(uint256 itemId, string memory name, uint256 price) public onlyOwner {
        items[itemId] = Item(name, price);
    }

    // Buy an item from the in-game store
    function purchaseItem(uint256 itemId) public {
        Item memory item = items[itemId];
        require(bytes(item.name).length != 0, "Item does not exist");
        require(!userItems[msg.sender][itemId], "Item already purchased");
        require(balanceOf(msg.sender) >= item.price, "Insufficient balance");

        // Transfer tokens from the user to the contract
        _transfer(msg.sender, address(this), item.price);

        // Mark the item as purchased by the user
        userItems[msg.sender][itemId] = true;

        // Emit the event
        emit ItemPurchased(msg.sender, itemId, item.name);
    }

    // Check if a user has purchased an item
    function hasPurchasedItem(address user, uint256 itemId) public view returns (bool) {
        return userItems[user][itemId];
    }
}
