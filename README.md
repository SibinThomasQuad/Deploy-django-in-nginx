# Deploy-django-in-nginx



    ->copy the django project to a folder in linux server

    ->create a virtual environment in python

    ->install requirements pip packages
    
    
    -> create a service for gunicorn
    
    #!/bin/sh
    . /var/www/python_projects/steel/env/bin/activate
    cd /var/www/python_projects/steel/web
    gunicorn --bind 127.0.0.1:8080 web.wsgi
