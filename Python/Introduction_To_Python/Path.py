import pandas as pd
from pathlib import Path

path = Path("../../SQL/raw_data")

for file in path.glob("*.csv"):
    df = pd.read_csv(file)
    print(f"Contents of {file.name}:")
    print(df.head()) # prints the first 5 rows
    print("\n")
