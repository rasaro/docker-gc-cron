# docker-gc-cron

Docker garbage collector configuration

## Requirements

- Docker
- Docker buildx
- Docker compose

## Building

```
docker buildx build -t rasaro/docker-gc-cron:latest --push --platform linux/amd64,linux/arm64,linux/arm .
```

## Running

### Environment variables

Copy example file

```
cp .env.example .env
```

Fill in fields in `.env`

#### Run container

```
docker stack deploy -c <(docker-compose config) docker-gc-cron
```
