#!/bin/bash

sudo docker compose up -d
sudo docker compose run web_app python manage.py makemigrations
sudo docker compose run web_app python manage.py migrate
name=root
password=Qwer!234
if [[ -n $1 ]] && [[ -n $2 ]] 
then
  name=$1
  password=$2
fi

sudo docker compose run -e DJANGO_SUPERUSER_PASSWORD=$password web_app python manage.py createsuperuser --noinput --username $name --email 1@1.ru 
