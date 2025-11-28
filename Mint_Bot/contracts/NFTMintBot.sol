// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title NFTMintBot
 * @dev Simulates an NFT minting bot contract with simple mint function and tracking
 */

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTMintBot is ERC721, Ownable {
    uint256 public tokenCounter;
    uint256 public maxMintPerTx;

    constructor(string memory _name, string memory _symbol, uint256 _maxMint) ERC721(_name, _symbol) {
        tokenCounter = 0;
        maxMintPerTx = _maxMint;
    }

    /**
     * @dev Mint multiple NFTs in a single transaction
     * @param numberOfTokens Number of tokens to mint
     */
    function mintNFT(uint256 numberOfTokens) public payable {
        require(numberOfTokens > 0 && numberOfTokens <= maxMintPerTx, "Exceeds max mint per transaction");

        for (uint256 i = 0; i < numberOfTokens; i++) {
            uint256 newTokenId = tokenCounter + 1;
            _safeMint(msg.sender, newTokenId);
            tokenCounter += 1;
        }
    }

    /**
     * @dev Owner can update the max mint per transaction
     */
    function setMaxMint(uint256 _maxMint) external onlyOwner {
        maxMintPerTx = _maxMint;
    }
}

