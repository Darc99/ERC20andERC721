// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DarcToken is ERC20 {

    // token price per ETH
    uint256 public tknPerEth = 1000;

    //to indicate the admin
    address public admin;

    constructor() ERC20("Darc ERC", "DRC") {
        _mint(msg.sender, 1000000 * 10 ** 18);

        //to make admin the deloyer
        admin = msg.sender;
    }

    function mint(address to, uint256 amount) external {
        //to make sure only the admin has access to this function
        require(msg.sender == admin, 'only admin has access');
        _mint(to, amount);
    }

    function buyToken(address receiver, uint256 amount) public returns (uint256){
                
        uint256 tokenAmount = amount * tknPerEth;
        
        _mint(receiver, tokenAmount);
        
        return tokenAmount;
    }

}