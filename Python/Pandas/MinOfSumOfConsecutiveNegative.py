# find the min of sum of consecutive negtive values
# for each column in a given dataframe
import pandas as pd
df = pd.read_csv('Book2.csv')
df = df.dropna()

def sumOfList(list, size):
    if (size == 0):
        return 0
    else:
        return list[size - 1] + sumOfList(list, size - 1)

a = []
min_df = []
for col, row in df.iteritems():
    min_df.append(min(row))
    main = []
    temp = []
    for i in row:
        if i<0 and not i+1 > 0:
            temp.append(i)
        if i>0:
            main.append(sumOfList(temp, len(temp)))
            temp=[]
    a.append(main)

min_a = []
for i in a:
    min_a.append(min(i))

DD_list = []
for i in range(len(df.columns)):
    DD_list.append(min(min_a[i], min_df[i]))

DD = pd.DataFrame(columns=['Columns', 'DD'])
DD.Columns = df.columns.tolist()
DD.DD = DD_list

print(DD)