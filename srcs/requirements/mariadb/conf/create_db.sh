#!bin/sh

mkdir /var/run/mysqld
chmod 777 /var/run/mysqld

echo -e "[mysqld]\nbind-address=0.0.0.0" > /etc/my.cnf.d/my.cnf
sed -i "s|skip-networking|skip-networking=0|g" \
    /etc/my.cnf.d/mariadb-server.cnf

mysql_install_db --user=mysql --datadir=/var/lib/mysql

cat << EOF > /tmp/create_db.sql
USE mysql;
FLUSH PRIVILEGES;
DROP DATABASE test;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT}';
CREATE DATABASE ${DB_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '${DB_USER}'@'%' IDENTIFIED by '${DB_PASS}';
GRANT ALL PRIVILEGES ON wordpress.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

/usr/bin/mysqld --user=mysql --bootstrap < /tmp/create_db.sql
rm -f /tmp/create_db.sql