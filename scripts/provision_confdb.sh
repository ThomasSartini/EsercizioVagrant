#!/bin/bash

DBNAME=vagrant
DBUSER=vagrant
DBPASSWD=vagrantpass
echo "Creating new db $DBNAME"
sudo mysql -e "DROP DATABASE IF EXISTS $DBNAME"
sudo mysql -e "CREATE DATABASE $DBNAME"
sudo mysql -e "DROP USER IF EXISTS $DBUSER"
sudo mysql -e "CREATE USER $DBUSER identified by '$DBPASSWD'"
sudo mysql -e "grant all privileges on $DBNAME.* to '$DBUSER'@'%'"

sudo mysql -e "CREATE TABLE vagrant.valori(id INT PRIMARY KEY auto_increment, valore VARCHAR(25));"
sudo mysql -e "INSERT INTO vagrant.valori(valore) VALUES('test');"