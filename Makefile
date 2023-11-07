export POSTGRESQL_URL='postgres://postgres:postgres@localhost:5432/authors?sslmode=disable&search_path=public'

# for both the migration commands, ensure that the POSTGRESQL_URL env var is
# set. Depending on the env, this var can change. Also, make sure it follows the
# following format: 
# export POSTGRESQL_URL='postgres://<username>:<password>@<host>:<port>/<dbname>?sslmode=disable&search_path=public'
.PHONY: migrate-up
migrate-up:
	migrate -database ${POSTGRESQL_URL} -path db/migrations up

.PHONY: migrate-down
migrate-down:
	migrate -database ${POSTGRESQL_URL} -path db/migrations down 1
