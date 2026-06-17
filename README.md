# Retail Sales Analytics Pipeline

End-to-end data analytics project demonstrating ETL pipeline development, 
SQL business analysis, and dashboard visualization using a retail 
superstore dataset (9,994 orders).

## Tech Stack
Python · SQL (SQLite) · Tableau  · Power BI (in progress)

## Project Overview

This project simulates a real-world analytics workflow:

1. **Extract** — Raw CSV sales data (9,994 orders, 21 fields)
2. **Transform** — Python (Pandas) cleans data, parses dates, removes 
   duplicates, and creates calculated fields (profit margin, shipping days)
3. **Load** — Cleaned data loaded into a SQLite database
4. **Analyze** — SQL queries answer key business questions
5. **Visualize** — Tableau Dashboard built ; Power BI dashboards (coming soon)

## Key Insights
- **Central region has a negative average profit margin (-10.41%)**, while West, East, and South are all profitable — flagging a potential pricing or cost issue specific to that region
- Technology category drives the highest profit ($145K), while Furniture lags significantly ($18K) despite similar sales volume
- Several product sub-categories operate at a net loss, identified through SQL analysis (see `analysis_queries.sql`)

## Files in This Repository

| File | Description |
|---|---|
| `etl_pipeline.py` | Python ETL script — extracts, cleans, and loads data into SQLite |
| `Sample-Superstore.csv` | Source dataset (Tableau's public sample data) |
| `superstore.db` | Cleaned SQLite database (output of ETL pipeline) |
| `analysis_queries.sql` | 6 SQL queries answering business questions |
| `Retail_Sales_Dashboard.twbx` | Tableau packaged workbook — interactive dashboard visualizing sales, profit, and regional performance |

## How to Run

**ETL Pipeline:**
```bash
python3 etl_pipeline.py
```

**SQL Queries:**
Open `superstore.db` in DB Browser for SQLite, then run queries from `analysis_queries.sql`

## Dashboard

The Tableau dashboard (`Retail_Sales_Dashboard.twbx`) visualizes sales, profit, and regional performance trends from the cleaned dataset, including [the specific views/sheets you built — e.g. sales by region, profit by category, top products].

To view it: download the file and open it in [Tableau Desktop](https://www.tableau.com/products/desktop) or [Tableau Reader](https://www.tableau.com/products/reader) — GitHub doesn't render .twbx files in the browser.

## Roadmap
- [ ] Power BI dashboard

## Author

**Sree Manju**  
Data Analyst | SQL · Python · Power BI · ETL  
[LinkedIn](www.linkedin.com/in/sree-manju-023233405)
