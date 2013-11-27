all:

postgresql-base-image:
	sudo docker build -t="pinnokio/postgresql:base" postgresql

postgresql-ssh-keys:
	ssh-keygen -q -t rsa -b 2048 -C "postgres@master1" -N '' -f postgresql/.ssh/1/id_rsa
	cat postgresql/.ssh/1/id_rsa.pub >> postgresql/.ssh/1/authorized_keys2
	ssh-keygen -q -t rsa -b 2048 -C "postgres@master2" -N '' -f postgresql/.ssh/2/id_rsa
	cat postgresql/.ssh/2/id_rsa.pub >> postgresql/.ssh/2/authorized_keys2

postgresql-wipe-keys:
	rm -f postgresql/.ssh/1/{id_rsa,id_rsa.pub,authorized_keys2}
	rm -f postgresql/.ssh/2/{id_rsa,id_rsa.pub,authorized_keys2}

nginx-base-image:
	sudo docker build -t="pinnokio/nginx:base" nginx

php-fpm-base-image:
	sudo docker build -t="pinnokio/php-fpm:base" php-fpm

run-posgresql-group1:
	sh helper_scripts/pg_group1_up

run-posgresql-group2:
	sh helper_scripts/pg_group2_up

wipe-containers:
	sudo docker rm $(docker ps -a -q)

kill-active-containers:
	sudo docker kill $(docker ps -q)


