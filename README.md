# Beanstalkd for Docker

## Deployment configuration

`docker-compose.yml`

```yaml
version: "3"
services:

  beanstalkd:
    container_name: beanstalkd
    hostname: beanstalkd
    image: designinlife/beanstalkd:1.13
    network_mode: bridge
    entrypoint: ["bootstrap.sh"]
    ports:
      - "11300:11300"
    volumes:
      - "/data/docker/var/beanstalkd:/var/lib/beanstalkd:rw"
      - "/etc/localtime:/etc/localtime:ro"
    environment:
      - "JOB_MAX_SIZE=2097152"
      - "WAL_ENABLED=0"
    restart: always
```

## Environment variables

| NAME         | DEFAULT VALUE   |
| :----------- | :-------------- |
| WAL_ENABLED  | `0`             |
| JOB_MAX_SIZE | `1048576` bytes |
