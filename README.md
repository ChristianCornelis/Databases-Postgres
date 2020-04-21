# Databases-Postgres
-A collection of PostgreSQL scripts to manipulate a simple credit card relational database system

- All steps listed in this readme assume that you are loaded into the database with `psql -h db`
- No error checking is done in any programs. Consult the table schemas for proper constraints and ensure that all parameters adhere to them.

- Creating the database and loading data:
  * Load the a3data.sql script
  * Run the a3data.sql script with: \i init.sql

- Deleting all tables
  * Load the del.sql script
  * Run the del.sql sript with \i del.sql script
