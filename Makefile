all:

postgresql-base-image:
	sudo docker build -t="pinnokio/postgresql:base" postgresql

postgres-ssh-keys:
	ssh-keygen -q -t rsa -b 2048 -C "postgres@master1" -N '' -f postgresql/.ssh/1/id_rsa
	echo postgresql/.ssh/1/id_rsa.pub >> postgresql/.ssh/1/authorized_keys
	ssh-keygen -q -t rsa -b 2048 -C "postgres@master2" -N '' -f postgresql/.ssh/2/id_rsa_m2
	echo postgresql/.ssh/2/id_rsa.pub >> postgresql/.ssh/2/authorized_keys

nginx-base-image:
	sudo docker build -t="pinnokio/nginx:base" nginx

php-fpm-base-image:
	sudo docker build -t="pinnokio/php-fpm:base" php-fpm
