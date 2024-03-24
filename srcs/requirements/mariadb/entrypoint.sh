#!/bin/bash

# Start MariaDB
mysqld_safe &

# Wait for MariaDB to start
sleep 10

# Run the SQL commands
mysql < /var/www/initial_db.sql

# Stop MariaDB
mysqladmin shutdown

# Start MariaDB in the foreground
exec mysqld