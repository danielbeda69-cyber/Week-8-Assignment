-- ============================================
-- WEEK 8 ASSIGNMENT: MYSQL DATABASE BACKUP AND RESTORE
-- Database: sales
-- Tool: mysqldump (run from the system terminal, not inside MySQL)
-- ============================================


-- ============================================
-- QUESTION 1: CREATING A COMPLETE DATABASE BACKUP
-- ============================================

-- Command:
-- mysqldump -u root -p sales > sales_backup.sql

-- Explanation:
-- mysqldump : the MySQL utility that exports a database as SQL statements.
-- -u root   : connects using the MySQL username "root".
-- -p        : makes MySQL prompt for the password, so it is not typed
--             in the command or saved in the terminal history.
-- sales     : the name of the database being backed up.
-- >         : redirects the output into a file instead of the screen.
-- sales_backup.sql : the file that stores the backup. It holds the CREATE TABLE
--             statements (structure) and the INSERT statements (data), so
--             it is a complete backup.
--
-- Why regular backups are important:
-- Backups protect against data loss from hardware failure, accidental
-- deletion, corrupted data, software bugs, human error and cyberattacks
-- such as ransomware. A recent backup lets the database be restored
-- quickly, which reduces downtime and supports disaster recovery. A
-- backup taken before major changes (updates, schema changes,
-- migrations) also lets you roll back if something goes wrong.

-- Restore (optional):
-- mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS sales;"
-- mysql -u root -p sales < sales_backup.sql


-- ============================================
-- QUESTION 2: BACKING UP ALL DATABASES
-- ============================================

-- Command:
-- mysqldump -u root -p --all-databases > all_databases_backup.sql

-- Explanation:
-- --all-databases : exports every database on the server (including sales)
--                   in one run, along with the CREATE DATABASE statements.
-- -u root         : connects as the MySQL user "root".
-- -p              : prompts for the password.
-- >               : redirects the output into all_databases_backup.sql.
--
-- Why backing up all databases matters before a migration:
-- A migration moves everything the server hosts to a new server. If any
-- database is left out, its data could be lost permanently. A single
-- complete backup makes sure that every database, table and record is
-- carried over, and it gives a safe fallback if the migration fails or
-- data is damaged along the way. After the migration, the backup can also
-- be used to check that the data on the new server matches the original.

-- Restore (optional):
-- mysql -u root -p < all_databases_backup.sql


-- ============================================
-- QUESTION 3: DATA-ONLY BACKUP (sales)
-- ============================================

-- Command:
-- mysqldump -u root -p --no-create-info sales > sales_data_only_backup.sql

-- Explanation:
-- --no-create-info skips the CREATE TABLE statements, so the file contains
-- only the INSERT statements (the data). The tables must already exist
-- when restoring.

-- Restore (optional):
-- mysql -u root -p sales < sales_data_only_backup.sql
