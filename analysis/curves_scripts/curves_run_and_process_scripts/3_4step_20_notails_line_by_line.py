import pandas as pd
import numpy as np 
import os

frames_raw = np.loadtxt('../0step_ves/frames_num.txt', delimiter=' ')
frames = frames_raw.astype(int)

#FOR FUTURE: Add every line (meaning every BP) as a new column in the df

os.mkdir('20_notails_curves_data')
for frame in frames:
  df = pd.read_fwf(f'./output/frame_{frame}.lis')
  df.to_csv('pandas_out.csv', index = False)
  A = df.iloc[40:146]
  A.to_csv('A_pandas_out.csv', index = False, header = None)
  B = df.iloc[189:295]
  B.to_csv('B_pandas_out.csv', index = False, header = None)
  C = df.iloc[337:443]
  C.to_csv('C_pandas_out.csv', index = False, header = None)
  D1 = df.iloc[485:591]
  D1.to_csv('D1_pandas_out.csv', index = False, header = None)
  D2 = df.iloc[632:738]
  D2.to_csv('D2_pandas_out.csv', index = False, header = None)
  E = df.iloc[798:1011]
  E.to_csv('E_pandas_out.csv', index = False, header = None)
  with open('E_pandas_out.csv','r',encoding='utf-8') as file:
    data = file.readlines()
    data[0] = "Level base base_n W12 D12 W21 D21\n"
  with open('E_pandas_out.csv', 'w', encoding='utf-8') as file:
    file.writelines(data)
  A_df = pd.read_csv('A_pandas_out.csv', delim_whitespace= True, header = None)
  B_df = pd.read_csv('B_pandas_out.csv', delim_whitespace= True, header = None)
  C_df = pd.read_csv('C_pandas_out.csv', delim_whitespace= True, header = None)
  D1_df = pd.read_csv('D1_pandas_out.csv', delim_whitespace= True, header = None)
  D2_df = pd.read_csv('D2_pandas_out.csv', delim_whitespace= True, header = None)
  E1_df = pd.read_csv('E_pandas_out.csv', delim_whitespace= True, header= None)
  E2_df = pd.read_csv('E_pandas_out.csv', delim_whitespace= True, header= None)
  E1_df.drop(index=E1_df.iloc[1::2,1].index.tolist(), inplace=True)
  E1_df.drop(columns=E1_df.iloc[:,[-1,-2]].columns.tolist(), inplace=True)
  E2_df.drop(index=E2_df.iloc[::2,:].index.tolist(), inplace=True)
  E2_df.drop(columns=E2_df.iloc[:,[1,2]].columns.tolist(), inplace=True)
  os.mkdir(f'20_notails_curves_data/data_{frame}')
  E1_df.columns = ['Level','W12', 'D12', 'W21', 'D21']
  E2_df.columns = ['Level','W12', 'D12', 'W21', 'D21']
  E_df = pd.concat([E1_df, E2_df]).sort_index(kind='merge')
  E_df.loc[0]=['Level', 'W12', 'D12', 'W21', 'D21']
  E_df.to_csv(f'20_notails_curves_data/data_{frame}/E_data.csv', index = False, header = None)
  A_df.to_csv(f'20_notails_curves_data/data_{frame}/A_data.csv', index = False, header = None)
  B_df.to_csv(f'20_notails_curves_data/data_{frame}/B_data.csv', index = False, header = None)
  C_df.to_csv(f'20_notails_curves_data/data_{frame}/C_data.csv', index = False, header = None)
  D1_df.to_csv(f'20_notails_curves_data/data_{frame}/D1_data.csv', index = False, header = None)
  D2_df.to_csv(f'20_notails_curves_data/data_{frame}/D2_data.csv', index = False, header = None)
  os.remove('A_pandas_out.csv')
  os.remove('B_pandas_out.csv')
  os.remove('C_pandas_out.csv')
  os.remove('D1_pandas_out.csv')
  os.remove('D2_pandas_out.csv')
  os.remove('E_pandas_out.csv')
  os.remove('pandas_out.csv')
