"""
simulate_mint.py
Simulates high-speed NFT minting process and logs results.
Author: Olanipekun Damilola David
"""

import time
import random

class NFTMintBotSimulator:
    def __init__(self, max_per_tx=5):
        self.token_counter = 0
        self.max_per_tx = max_per_tx
        self.minted_tokens = []

    def mint(self, num_tokens):
        if num_tokens <= 0 or num_tokens > self.max_per_tx:
            print(f"Error: Can mint 1-{self.max_per_tx} tokens per transaction.")
            return
        for _ in range(num_tokens):
            self.token_counter += 1
            self.minted_tokens.append(self.token_counter)
            time.sleep(0.1)  # simulate network delay
        print(f"Successfully minted {num_tokens} tokens. Total minted: {self.token_counter}")

if __name__ == "__main__":
    bot = NFTMintBotSimulator(max_per_tx=5)
    print("Starting NFT Mint Simulation...")

    # Simulate multiple transactions
    transactions = [2, 3, 1, 5]
    for t in transactions:
        bot.mint(t)
        print(f"Current minted tokens: {bot.minted_tokens}")

