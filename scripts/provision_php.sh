#!/bin/bash
echo "PHP installation - begin"
sudo apt-get install php -y
sudo systemctl restart apache2
sudo apt-get install php-mysql -y
sudo systemctl restart apache2
echo "PHP installation - end"