"""
crypto_payment_backend.py
Simulates backend crypto payment processing for Pendax platform.
Author: Olanipekun Damilola David
"""

import random
import time

class PendaxBackendSimulator:
    def __init__(self):
        self.user_balances = {}

    def make_payment(self, user, amount, reference):
        if amount <= 0:
            print("Error: Payment must be greater than zero")
            return
        self.user_balances[user] = self.user_balances.get(user, 0) + amount
        print(f"Payment received: {amount} from {user}. Reference: {reference}")

    def withdraw(self, user, amount):
        balance = self.user_balances.get(user, 0)
        if amount > balance:
            print("Error: Insufficient balance")
            return
        self.user_balances[user] -= amount
        print(f"{user} withdrew {amount}. Remaining balance: {self.user_balances[user]}")

if __name__ == "__main__":
    backend = PendaxBackendSimulator()
    print("Pendax Backend Payment Simulation")

    # Simulate payments
    backend.make_payment("alice", 100, "Electricity Bill")
    backend.make_payment("bob", 50, "Water Bill")

    # Simulate withdrawals
    backend.withdraw("alice", 40)
    backend.withdraw("bob", 25)

