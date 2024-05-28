// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Degen is ERC20 {
    address public owner;
    uint public id;

    struct Item {
        address owner;
        uint256 price;
        string title;
    }

    mapping(uint => Item) public Items;

    constructor() ERC20("Degen", "DGN") {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function transfer(
        address to,
        uint256 amount
    ) public virtual override returns (bool success) {
        success = super.transfer(to, amount);
    }

    function burn(uint amount) public {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender, amount);
    }

    function createItem(uint256 price, string memory _title) public onlyOwner {
        id++;
        Item storage item = Items[id];
        item.owner = address(this);
        item.price = price;
        item.title = _title;
    }

    function redeem(uint id_) public {
        require(id_ <= id, "item does not exist");
        Item storage _item = Items[id_];

        require(_item.owner == address(this), "item already redeemed");
        _burn(msg.sender, _item.price);
        _item.owner = msg.sender;
    }

    function isUnclaimed(uint id_) public view returns (bool) {
        Item storage _item = Items[id_];
        return (_item.owner != address(this));
    }

    function showItems(uint id_) public view returns (Item memory) {
        return Items[id_];
    }
}