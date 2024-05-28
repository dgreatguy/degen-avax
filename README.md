# DEGEN Token Contract

The DEGEN contract is an ERC20 token with additional features.  It enables the contract owner to produce redeemable things in addition to the basic ERC20 functionality, which users can obtain by burning a specific quantity of tokens. There is only one redemption per item.

## Contract Address

### **0x2F68427a28BBCDFB9EA095Da40543C311c4D9b55**

### **[Contract address on Snowtrace](https://testnet.snowtrace.io/address/0x2F68427a28BBCDFB9EA095Da40543C311c4D9b55)**

## Contract Structure

This contract leverages the OpenZeppelin ERC20 contract for basic ERC20 functionality, and it is built on Solidity version 0.8.19.

### State Variables

- `owner` - The contract's owner address
- `id` - A counter used to keep track of the most recent item id created
- `Items` - A mapping from `id` to `Item`, which allows to retrieve item details using its id

### Structs

- `Item` - Represents an item, which has an owner, an amount, and a name

### Functions

- `mint(address to, uint256 amount)` - Allows the owner to mint new tokens to any address
- `burn(uint amount)` - Allows a user to burn tokens
- `transfer(address to, uint256 amount)` - Allows a user to transfer their tokens to a different address
- `createItem(uint256 amount, string memory _name)` - Allows the owner to create a new item with a specified amount and name
- `redeem(uint id_)` - Allows a user to redeem an item, at which point the token value is burnt from the redeemer's balance and the object's owner is updated to the redeemer's address.
- `isUnclaimed(uint id_)` - Verifies whether an item has been claimed
- `showItems(uint id_)` - Returns the details of an item given its id

## Usage

1. **Deployment:** When deploying this contract, the deployer address is set as the owner.
2. **Creating an Item:** The contract owner can create new items using the `createItem` function.
3. **Minting Tokens:** The contract owner can mint new tokens using the `mint` function.
4. **Burning Tokens:** Users can burn their tokens using the `burn` function.
5. **Redeeming an Item:** Any user can redeem an item using the `redeem` function, provided the item exists and is not already redeemed.
6. **Checking Item Status:** Anyone can check if an item is unclaimed using the `isUnclaimed` function.
7. **Viewing Item Details:** Anyone can view the details of an item using the `showItems` function.

## License

This contract is released under the MIT License.