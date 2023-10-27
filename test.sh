#!/bin/bash

# Texto en rojo: \033[0;31m
# Texto en verde: \033[0;32m
# Texto en amarillo: \033[0;33m
# Texto en azul: \033[0;34m
# Texto en morado: \033[0;35m
# Texto en cian: \033[0;36m
# Texto en blanco: \033[0;37m

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
