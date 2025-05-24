import matplotlib.pyplot as plt
import pandas as pd

"""
# Sample data
x = [1, 2, 3, 4, 5]
y = [10, 20, 25, 30, 40]

# Create a plot
plt.plot(x, y)

# Add a title and labels
plt.title('Sample Plot')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')

# Display the plot
plt.show()
"""

# Using a raw string
csv_file_path = r'C:\Users\Omer.Shehzad\Documents\Python\covid19_italy_region.csv'

# Load the dataset into a DataFrame
df = pd.read_csv(csv_file_path)

print("First 5 records and last 5 records:", df)