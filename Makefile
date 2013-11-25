all:

postgresql-base-image:
	sudo docker build -t="pinnokio/postgresql:base" postgresql
postgres-ssh-keys:
	ssh-keygen -q -t rsa -b 2048 -C "postgres@master" -N '' -f postgresql/.ssh/id_rsa
