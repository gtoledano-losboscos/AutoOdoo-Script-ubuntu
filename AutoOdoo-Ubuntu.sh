#!/bin/bash

# Presentación -----------------------------------------------------------------------
echo -e "\033[0;95m
    _______       _____      ________________                 ________            _____        _____ 
    ___    |___  ___  /________  __ \_____  /___________      __  ___/_______________(_)_________  /_
    __  /| |  / / /  __/  __ \  / / /  __  /_  __ \  __ \     _____ \_  ___/_  ___/_  /___  __ \  __/
    _  ___ / /_/ // /_ / /_/ / /_/ // /_/ / / /_/ / /_/ /     ____/ // /__ _  /   _  / __  /_/ / /_  
    /_/  |_\__,_/ \__/ \____/\____/ \__,_/  \____/\____/      /____/ \___/ /_/    /_/  _  .___/\__/  
                                                                                        /_/           "

echo -e "\033[0;96m
                             _              _       _       _             
                            | |_ _ _    ___| |_ ___| |___ _| |___ ___ ___ 
                            | . | | |  | . |  _| . | | -_| . | .'|   | . |
                            |___|_  |  |_  |_| |___|_|___|___|__,|_|_|___|
                                |___|  |___| 
\033[0;37m"

echo ""
echo ""

echo -e "\033[0;91m -------------------------- ¡ATENCIÓN! ------------------------- \033[0;37m"
echo "Este script convertirá tu equipo en un servidor de Odoo."
echo ""
echo ""

echo -e "\033[0;91mSe requieren permisos de superusuario para instalar las herramientas necesarias.\033[0;37m"

echo -e "Se instalarán las siguientes herramientas:\033[0;92m"
echo -e " - PostgreSQL"
echo -e " - Odoo"
echo -e " - pgAdmin4\033[0;37m"

echo ""
echo ""

echo -e "\033[0;96mPresiona ENTER para continuar o CTRL+C para cancelar.\033[0;37m"
read -p ""

$POSTGRES_NAME = $NAME
$POSTGRES_PASSWORD = $PASSWORD
$PGADMIN_SETUP_EMAIL = $EMAIL
$PGADMIN_SETUP_PASSWORD = $PASSWORD

export $PGADMIN_SETUP_EMAIL
export $PGADMIN_SETUP_PASSWORD

# Actualización del sistema ----------------------------------------------------------
sudo apt update && sudo apt upgrade -y

# Instalación de herramientas necesarias ---------------------------------------------
if command -v wget > /dev/null 2>&1;
then
    echo "wget is already installed"
else
    echo "wget is not installed. Installing wget..."
    sudo apt install wget -y
fi

# Instalación de PostgreSQL ----------------------------------------------------------
sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update

# Install the latest version of PostgreSQL.
sudo apt-get install postgresql postgresql-contrib -y

# Create a new database user:
sudo -u postgres psql -c "CREATE USER $POSTGRES_NAME WITH PASSWORD '$POSTGRES_PASSWORD';"
sudo -u postgres psql -c "ALTER USER $POSTGRES_NAME WITH SUPERUSER;"
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '$POSTGRES_PASSWORD';"


# Instalación de pgAdmin4 ------------------------------------------------------------
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
sudo apt install pgadmin4-web -y
sudo /usr/pgadmin4/bin/setup-web.sh -y

# Instalación de Odoo ----------------------------------------------------------------
wget -q -O - https://nightly.odoo.com/odoo.key | sudo gpg --dearmor -o /usr/share/keyrings/odoo-archive-keyring.gpg
echo 'deb [signed-by=/usr/share/keyrings/odoo-archive-keyring.gpg] https://nightly.odoo.com/16.0/nightly/deb/ ./' | sudo tee /etc/apt/sources.list.d/odoo.list
sudo apt-get update && sudo apt-get install odoo -y

# Finalización -----------------------------------------------------------------------
ip_address=$(ip -4 addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v '^127\.0\.0\.1$')
echo ""
echo ""
echo -e "\033[0;92mInstalación finalizada.\033[0;37m"
echo ""
echo -e "Odoo: \033[0;96mhttp://$ip_address:8069\033[0;37m"
echo -e "pgAdmin4: \033[0;96mhttp://$ip_address/pgadmin4\033[0;37m"
echo ""
echo "Utilice las credenciales proporcionadas para acceder a PgAdmin4
echo ""
echo -e "\033[0;96mPresiona ENTER para terminar.\033[0;37m"
read -p ""
