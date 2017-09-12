#!/usr/bin/env bash

hugo -D
tar -cvf public.tar ./public/
scp public.tar root@www.sunzhongmou.com:/home/public.tar
scp docker-run.sh root@www.sunzhongmou.com:/home/docker-run.sh
ssh root@www.sunzhongmou.com "sh /home/docker-run.sh"