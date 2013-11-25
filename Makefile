all:

build-postgresql-base:
	sudo docker build -t="pinnokio/postgresql:base" postgresql
