
"""
pressure_analysis.py
Simulates atmospheric pressure analysis using ERA5 dataset.
Author: Olanipekun Damilola David
"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# Load sample data
data_file = "../data_samples/sample_pressure_data.csv"
df = pd.read_csv(data_file)

# Preview data
print("First 5 rows of sample data:")
print(df.head())

# Example: Calculate mean pressure at each altitude
mean_pressures = df.groupby("Pressure_Level_hPa")["Pressure_Value_hPa"].mean()
print("\nMean pressure per level:")
print(mean_pressures)

# Plot pressure profile
plt.figure(figsize=(8,6))
plt.plot(mean_pressures.values, mean_pressures.index)
plt.gca().invert_yaxis()  # Higher altitude on top
plt.xlabel("Pressure (hPa)")
plt.ylabel("Pressure Level (hPa)")
plt.title("Atmospheric Pressure Profile")
plt.grid(True)
plt.savefig("pressure_profile.png")
plt.show()
