all: up

up:
	docker-compose up -d

stop:
	docker-compose stop

backup: stop
	docker-compose run --rm gitlab app:rake gitlab:backup:create

backup_aws: stop
	docker-compose run --rm -e AWS_BACKUPS=true gitlab app:rake gitlab:backup:create

restore: stop
	docker-compose run --rm gitlab app:rake gitlab:backup:restore

clean:
	docker-compose stop && docker-compose rm --force && sudo rm -rf *-data
