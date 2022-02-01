import numpy as np
import pandas as pd

df = pd.read_csv(
    'https://raw.githubusercontent.com/krishnaik06/All-Hyperparamter-Optimization/master/diabetes.csv')
df['Glucose'] = np.where(
    df['Glucose'] == 0, df['Glucose'].median(), df['Glucose'])
df['Insulin'] = np.where(
    df['Insulin'] == 0, df['Insulin'].median(), df['Insulin'])
