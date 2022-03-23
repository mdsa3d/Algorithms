from datetime import datetime

# First method
today_date = str(datetime.today().date())
print('Date is {} and its type is {}'.format(today_date, type(today_date)))

# Second Method
d = datetime.today().strftime('%Y-%m-%d')
print('Date is {} and its type is {}'.format(d, type(d)))

# Third method of directly importing date
from datetime import date
t_date = date.today().isoformat()
print('Date is {} and its type is {}'.format(t_date, type(t_date)))
