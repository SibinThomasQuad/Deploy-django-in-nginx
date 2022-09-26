#!/bin/sh
. /var/www/python_projects/steel/env/bin/activate
cd /var/www/python_projects/steel/web
gunicorn --bind 127.0.0.1:8080 web.wsgi
