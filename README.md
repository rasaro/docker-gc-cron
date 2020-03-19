# dockergc

Docker garbage collector configuration

## Requirements

- Docker
- Docker compose

## Running

### Environment variables

Copy example file

```
cp .env.example .env
```

Fill in fields in `.env`

#### Run container

```
docker stack deploy -c <(docker-compose config) dockergc
```
