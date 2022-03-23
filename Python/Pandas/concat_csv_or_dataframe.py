import pandas as pd
f1 = pd.read_csv(file1, header=None)
f2 = pd.read_csv(file2, header=None)
merged = pd.concat([f1, f2])