MYSQL_USER="root"
MYSQL_PASSWORD="MariaDB@123"
DB_USER="wiki"
DB_PASSWORD="Wiki@123"
DB_NAME="wikidatabase"

# Execute the MySQL commands using a Here Document
mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" <<EOF
CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
CREATE DATABASE $DB_NAME;
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;
SHOW DATABASES;
SHOW GRANTS FOR '$DB_USER'@'localhost';
exit
EOF
