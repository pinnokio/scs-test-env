all:

postgresql-base-image:
	sudo docker build -t="pinnokio/postgresql:base" postgresql

postgresql-ssh-keys:
	ssh-keygen -q -t rsa -b 2048 -C "postgres@master1" -N '' -f postgresql/.ssh/1/id_rsa
	cat postgresql/.ssh/1/id_rsa.pub >> postgresql/.ssh/1/authorized_keys
	ssh-keygen -q -t rsa -b 2048 -C "postgres@master2" -N '' -f postgresql/.ssh/2/id_rsa_m2
	cat postgresql/.ssh/2/id_rsa.pub >> postgresql/.ssh/2/authorized_keys

postgresql-wipe-keys:

nginx-base-image:
	sudo docker build -t="pinnokio/nginx:base" nginx

php-fpm-base-image:
	sudo docker build -t="pinnokio/php-fpm:base" php-fpm
