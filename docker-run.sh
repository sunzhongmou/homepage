#!/usr/bin/env bash

cd /home && mkdir -p homepage

mv /home/public.tar /home/homepage/
cd /home/homepage
tar -xvf public.tar
rm -rf public.tar

docker stop zm-home || true
docker rm zm-home || true

docker run -dit --name zm-home -e VIRTUAL_HOST=www.sunzhongmou.com -p 8802:80 -v /home/homepage/public:/usr/local/apache2/htdocs/ httpd:2.4
