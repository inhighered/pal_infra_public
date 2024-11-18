# DB Setup

Spin up container

```sh
docker build -t pal-postgres:latest .

# run with env vars
docker run --name pal-postgres -d -p 5432:5432 \
  -e POSTGRES_DB="pal" \
  -e POSTGRES_USER="admin" \
  -e POSTGRES_PASSWORD="admin" \
  -e PAL_SVC_PASSWORD="default" \
  pal-postgres:latest

docker exec -it pal-postgres psql -U postgres
```

## PG Admin
If we want to manage DB more - spin up pg admin
```sh
docker pull dpage/pgadmin4:latest

docker run --name pgadmin -p 8081:80 -e 'PGADMIN_DEFAULT_EMAIL=user@domain.com' -e 'PGADMIN_DEFAULT_PASSWORD=SuperSecret' -d dpage/pgadmin4
```

#### PG Admin Defaults:
- connect on: host.docker.internal
- user: user@domain.com
- pass: SuperSecret