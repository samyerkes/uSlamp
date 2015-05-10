#!/usr/bin/env bash

# Determine if this machine has already been provisioned
# Basically, run everything after this command once, and only once
if [ -f "/var/vagrant_provision" ]; then 
    exit 0
fi

function say {
    printf "\n--------------------------------------------------------\n"
    printf "\t$1"
    printf "\n--------------------------------------------------------\n"
}

#Update ubuntu
sudo apt-get update

#Install Nano
say "Installing Nano"
    sudo apt-get install nano

# Install Apache
say "Installing Apache and setting it up."
    sudo apt-get install apache2 -y

# Install mysql
# say "Installing MySQL."
#     sudo apt-get install mysql-server libapache2-mod-auth-mysql php5-mysql
#     sudo mysql_install_db
#     mysql -u root mysql <<< "GRANT ALL ON *.* TO 'root'@'%'; FLUSH PRIVILEGES;"

say "Installing PHP"
    sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt -y

# Restart Apache
say "Restarting Apache"
    sudo service apache2 restart

# Let this script know not to run again
touch /var/vagrant_provision