# flaskdemo
Flask Hello World example using AWS CI-CD

Commands Used:

sudo yum install epel-release
sudo yum install python3-pip python3-devel gcc nginx

sudo pip3 install virtualenv
virtualenv flaskdemo-env
source flaskdemo-env/bin/activate


pip3 install gunicorn flask
gunicorn --bind 0.0.0.0:8000 wsgi

sudo nano /etc/systemd/system/flaskdemo.service
CONTENT:
==================================================================================================
[Unit]
Description=Gunicorn instance to serve flaskdemo
After=network.target

[Service]
User=user
Group=nginx
WorkingDirectory=/home/ec2-user/projects/flaskdemo/
Environment="PATH=/home/ec2-user/projects/flaskdemo/flaskdemo-env/bin"
ExecStart=/home/ec2-user/projects/flaskdemo/flaskdemo-env/bin/gunicorn --workers 1 --bind unix:myproject.sock -m 007 wsgi

[Install]
WantedBy=multi-user.target
===================================================================================================

sudo systemctl start flaskdemo
sudo systemctl enable flaskdemo


sudo nano /etc/nginx/nginx.conf
CONTENT: Add above server block
=====================================================================================================
server {
    listen 80;
    server_name server_domain_or_IP;

    location / {
        proxy_set_header Host $http_host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_pass http://unix:/home/ec2-user/projects/flaskdemo/flaskdemo.sock;
    }
}
====================================================================================================

sudo usermod -a -G ec2-user nginx
chmod 710 /home/ec2-user
sudo nginx -t

sudo systemctl start nginx
sudo systemctl enable nginx
