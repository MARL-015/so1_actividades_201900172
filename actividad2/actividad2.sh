#!/bin/bash

# Leer usuario de GITHUB
echo "Ingrese el usuario de github"
read GITHUB_USER

content=$(curl -s https://api.github.com/users/$GITHUB_USER)

# Uso de libreria jq para parsear el JSON (user, id, fecha de creacion)
user=$(echo $content | jq '.login')
gid=$(echo $content | jq '.id')
infecha=$(echo $content | jq '.created_at')

#Fecha del Sistema
F_date=$(date +"%d-%m-%Y %T")

#Creacion de carpeta para almacenar log
mkdir -p "/tmp/$F_date"

#Resultado y creacion del log file
echo "Hola $user. User ID: $gid. Cuenta fue creada el: $infecha." >> "/tmp/$F_date/saludos.log"