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
        
     -> check by service steel start , service steel status
     
        create a conf file in conf.d in etc/nginx/conf.d
        
        put this code on it
        server {
    listen 80;
    
    server_name steel;

    return 301 https://spms.steel-ships.com$request_uri;
}




server {
    listen        80;
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    client_max_body_size 100M;
    server_name steel;
    ssl_certificate /etc/ssl/certs/spms.steel-ships.com.crt;
    ssl_certificate_key /etc/ssl/private/spms.steel-ships.com_key.key;
    ssl_protocols TLSv1.2 TLSv1.1 TLSv1;
    location / {
        proxy_pass         http://localhost:8000;
        proxy_http_version 1.1;
        proxy_set_header   Upgrade $http_upgrade;
        proxy_set_header   Connection keep-alive;
        proxy_set_header   Host $host;
        proxy_cache_bypass $http_upgrade;
        proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header   X-Forwarded-Proto $scheme;
    }
    location /static {
    autoindex on;
    alias /var/steel/web/static;
    }
}

    
    
