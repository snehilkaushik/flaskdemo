#!/bin/bash
#gunicorn --bind 0.0.0.0:8000 wsgi
nginx -t
service nginx restart