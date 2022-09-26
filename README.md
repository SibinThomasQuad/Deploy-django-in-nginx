# Deploy-django-in-nginx



    ->copy the django project to a folder in linux server

    ->create a virtual environment in python

    ->install requirements pip packages
    
    
    -> create a service for gunicorn
    
    #!/bin/sh
    . /var/www/python_projects/steel/env/bin/activate
    cd /var/www/python_projects/steel/web
    gunicorn --bind 127.0.0.1:8080 web.wsgi
    
    -> Put this sh file to /usr/bin  folder
    
    -> change its permission to +x  using chmod
    
    -> make this sh as service 
        nano /etc/systemd/system/steel.service
        
    -> eg code 
    
        [Unit]
        Description=steel ship service gunicorn
        After=network.target

        [Service]
        Type=simple
        ExecStart=/usr/bin/steel.sh
        TimeoutStartSec=0

        [Install]
        WantedBy=default.target
    
    
