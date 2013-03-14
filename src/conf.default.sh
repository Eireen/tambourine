#!/bin/bash

SUDO_OPTS['nopasswd']=yes

USER_OPTS['login']=testuser
USER_OPTS['password']=testpass
USER_OPTS['sudoer']=yes

SSH_OPTS['port']=12345
SSH_OPTS['forbid-root']=yes

FTP_OPTS['disable-anonymous']=yes
FTP_OPTS['enable-local']=yes
FTP_OPTS['enable-write']=yes

MYSQL_OPTS['remote-access']=yes

NGINX_OPTS['auth']=yes
NGINX_OPTS['gzip-static']=yes
