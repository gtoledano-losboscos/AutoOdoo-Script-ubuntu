#!/bin/bash

sudo apt update && sudo apt upgrade -y

# sudo apt install git -y

# Instalación de herramientas necesarias ---------------------------------------------
if command -v wget > /dev/null 2>&1;
then
    echo "wget is already installed"
else
    echo "wget is not installed. Installing wget..."
    sudo apt install wget -y
fi




# Instalación de PostgreSQL ----------------------------------------------------------

Create the file repository configuration:
sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# Import the repository signing key:
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Update the package lists:
sudo apt-get update

# Install the latest version of PostgreSQL.
# If you want a specific version, use 'postgresql-12' or similar instead of 'postgresql':
sudo apt-get -y install postgresql postgresql-contrib




# Instalación de Odoo ----------------------------------------------------------------

wget -q -O - https://nightly.odoo.com/odoo.key | sudo gpg --dearmor -o /usr/share/keyrings/odoo-archive-keyring.gpg
echo 'deb [signed-by=/usr/share/keyrings/odoo-archive-keyring.gpg] https://nightly.odoo.com/16.0/nightly/deb/ ./' | sudo tee /etc/apt/sources.list.d/odoo.list
sudo apt-get update && sudo apt-get install odoo

