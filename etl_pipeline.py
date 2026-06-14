import pandas as pd
import sqlite3

# EXTRACT
print("Extracting data...")
df = pd.read_csv('Sample-Superstore.csv', encoding='latin1')

# TRANSFORM
print("Transforming data...")

# Clean column names
df.columns = df.columns.str.strip().str.replace(' ', '_').str.lower()

# Convert date columns
df['order_date'] = pd.to_datetime(df['order_date'])
df['ship_date'] = pd.to_datetime(df['ship_date'])

# Remove duplicates
df = df.drop_duplicates()

# Handle missing values
df = df.dropna(subset=['sales', 'profit'])

# Create new calculated columns
df['order_year'] = df['order_date'].dt.year
df['order_month'] = df['order_date'].dt.month
df['shipping_days'] = (df['ship_date'] - df['order_date']).dt.days
df['profit_margin'] = (df['profit'] / df['sales'] * 100).round(2)

print(f"Data cleaned: {len(df)} rows")

# LOAD
print("Loading into SQLite database...")
conn = sqlite3.connect('superstore.db')
df.to_sql('sales', conn, if_exists='replace', index=False)
conn.close()

print("ETL Pipeline Complete! Data loaded into superstore.db")