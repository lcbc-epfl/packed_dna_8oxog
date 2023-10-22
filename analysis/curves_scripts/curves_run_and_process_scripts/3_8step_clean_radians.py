import pandas as pd
import numpy as np
import os

df = pd.read_csv('20_notails_bybase_data.csv', header = None, low_memory = False)
for column in df.columns[::]:
    df[column] = pd.to_numeric(df[column], errors = 'coerce')
    df[column] = np.where((df[column].max() > 165) & (df[column].min() < -165) & (df[column] < 0), df[column] + 360, df[column])

for column in df.columns[2014:3922]:
    df[column] = df[column]*(np.pi)/180    

df.to_csv(f'clean_20_notails_bybase_data.csv', index = False, header = None)

