# Get the overview of data using command line interface
# The results are displayed in beautiful tables within terminal.
# You can install this package usign `pip3 install skimpy`
from skimpy import skim, generate_test_data
df = generate_test_data()
skim(df)