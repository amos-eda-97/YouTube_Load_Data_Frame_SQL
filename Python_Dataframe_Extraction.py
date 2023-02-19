import pyodbc
import pandas as pd
from decimal import Decimal
import datetime
# Set the connection parameters
server = 'PC001171\SQLEXPRESS'
database = 'myYoutubeDatabase'

# Create the connection string
conn_str = (
    'DRIVER={SQL Server};'
    f'SERVER={server};'
    f'DATABASE={database};'
)

# Connect to the database
conn = pyodbc.connect(conn_str)

# Create a cursor object to execute queries
cursor = conn.cursor()

# Execute a sample query
query = 'SELECT * FROM Sales'
cursor.execute(query)

# Fetch the results and print them
results = cursor.fetchall()
# print(list(results))

# Define the column names manually or retrieve them from the database schema
columns = ['SalesID', 'ProductID', 'VendorID', 'RegionID', 'Date', 'Discount', 'Quantity', 'SalesAmount']

# Create a pandas DataFrame from the results and column names
empt_convert_list = []
for i in results: 
    convertList = list(i)
    converted_list = [float(x) if isinstance(x, Decimal) else x for x in convertList]
    converted_list = [i.strftime('%Y-%m-%d %H:%M:%S') if isinstance(i,datetime.datetime) else i for i in converted_list]
    empt_convert_list.append(converted_list)
print(empt_convert_list)
df = pd.DataFrame(empt_convert_list, columns=columns)

# Print the DataFrame to check that the data is properly loaded
# print(df)

# Close the cursor and connection
cursor.close()
conn.close()

display(df)
