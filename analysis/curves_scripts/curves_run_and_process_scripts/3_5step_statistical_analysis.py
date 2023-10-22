import pandas as pd
import numpy as np
import os

frames_raw = np.loadtxt('../0step_ves/frames_num.txt', delimiter=' ')
frames = frames_raw.astype(int)


os.mkdir('20_notails_statistical_results')

A_data = []
for i in frames:
  A_data.append(pd.read_csv(f'20_notails_curves_data/data_{i}/A_data.csv'))
  A_corr = []
for df in A_data:
  df = df.set_axis(['N)','Base1','Base2','N','Xdisp','Ydisp','Inclin','Tip','Ax-Bend'], axis = 'columns', copy = False)
  df = df.drop(columns = ['N)','Base1','Base2','N'])
  df = df.replace('---', np.nan)
  A_corr.append(df)
A_all = pd.concat(A_data)
A_av = sum(A_corr)/len(A_corr)

Adescriptions = []
for df in A_corr:
  description = pd.DataFrame(df.describe())
  Adescriptions.append(description)
all_Adescribed = pd.concat(Adescriptions)
all_Adescribed.to_csv(f'20_notails_statistical_results/A_statistical_analysis.csv', index = False)


B_data = []
for i in frames:
    B_data.append(pd.read_csv(f'20_notails_curves_data/data_{i}/B_data.csv'))
B_corr = []
for df in B_data:
    df = df.set_axis(['N)','Base1','Base2','N','Shear','Stretch','Stagger','Buckle','Propel','Opening'], axis = 'columns', copy = False)
    df = df.drop(columns = ['N)','Base1','Base2','N'])
    B_corr.append(df)
B_all = pd.concat(B_data)
B_av = sum(B_corr)/len(B_corr)

Bdescriptions = []
for df in B_corr:
    description = pd.DataFrame(df.describe())
    Bdescriptions.append(description)
all_Bdescribed = pd.concat(Bdescriptions)
all_Bdescribed.to_csv(f'20_notails_statistical_results/B_statistical_analysis.csv', index = False)



C_data = []
for i in frames:
    C_data.append(pd.read_csv(f'20_notails_curves_data/data_{i}/C_data.csv'))
C_corr = []
for df in C_data:
    df = df.set_axis(['N)','Base1','Base2','N','Shift','Slide','Rise','Tilt','Roll','Twist','H-ris','H-twi'], axis = 'columns', copy = False)
    df = df.drop(columns = ['N)','Base1','Base2','N'])
    C_corr.append(df)
C_all = pd.concat(C_data)
C_av = sum(C_corr)/len(C_corr)

Cdescriptions = []
for df in C_corr:
    description = pd.DataFrame(df.describe())
    Cdescriptions.append(description)
all_Cdescribed = pd.concat(Cdescriptions)
all_Cdescribed.to_csv(f'20_notails_statistical_results/C_statistical_analysis.csv', index = False)


D1_data = []
for i in frames:
    D1_data.append(pd.read_csv(f'20_notails_curves_data/data_{i}/D1_data.csv'))
D1_corr = []
for df in D1_data:
    df = df.set_axis(['N)','Base','N','Alpha','Beta','Gamma','Delta','Epsilon','Zeta','Chi','Phase','Ampli','Pucker'], axis = 'columns', copy = False)
    df1 = df.drop(columns = ['N)','Base','N','Pucker'])
    df2 = df1.replace('----', np.nan)
    D1_corr.append(df2)
D1_all = pd.concat(D1_data)
#D1_av = sum(D1_corr)/len(D1_corr)

D1descriptions = []
for df in D1_corr:
    df = df.astype(float)
    description = pd.DataFrame(df.describe())
    D1descriptions.append(description)
all_D1described = pd.concat(D1descriptions)
all_D1described.to_csv(f'20_notails_statistical_results/D1_statistical_analysis.csv', index = False)


D2_data = []
for i in frames:
    D2_data.append(pd.read_csv(f'20_notails_curves_data/data_{i}/D2_data.csv'))
D2_corr = []
for df in D2_data:
    df = df.set_axis(['N)','Base','N','Alpha','Beta','Gamma','Delta','Epsilon','Zeta','Chi','Phase','Ampli','Pucker'], axis = 'columns', copy = False)
    df1 = df.drop(columns = ['N)','Base','N','Pucker'])
    df2 = df1.replace('----', np.nan)
    D2_corr.append(df2)
D2_all = pd.concat(D2_data)
#D2_av = sum(D2_corr)/len(D2_corr)

D2descriptions = []
for df in D2_corr:
    df = df.astype(float)  
    description = pd.DataFrame(df.describe())
    D2descriptions.append(description)
all_D2described = pd.concat(D2descriptions)
all_D2described.to_csv(f'20_notails_statistical_results/D2_statistical_analysis.csv', index = False)


E_data = []
for i in frames:
    E_data.append(pd.read_csv(f'20_notails_curves_data/data_{i}/E_data.csv'))
E_corr = []
for df in E_data:
    df = df.set_axis(['Level','W12','D12','W21','D21'], axis = 'columns', copy = False)
    df = df.drop(columns = ['Level'])
    df = df.replace('', np.nan)
    E_corr.append(df)
E_all = pd.concat(E_data)
#E_av = sum(E_corr)/len(E_corr)

Edescriptions = []
for df in E_corr:
    description = pd.DataFrame(df.describe())
    Edescriptions.append(description)
all_Edescribed = pd.concat(Edescriptions)
all_Edescribed.to_csv(f'20_notails_statistical_results/E_statistical_analysis.csv', index = False)


