# satisfactory-server-docker

Standalone Satisfactory server via Docker.

## Setup

Create directory for Docker volume:

```shell
mkdir -p ./data
```

On some operating systems (esp. Linux), Docker will create the `data/` directory with `root` as the owner if you don't create it first.

## Run:

```shell
docker compose up -d
```

- Remove the `-d` option if you want the service to run in the foreground
- Add `--build` to force a rebuild
- Stop the service with `docker compose down`

## Misc.

Originally based on instructions from ["Running as a Service" on Satisfactory Wiki](https://satisfactory.fandom.com/wiki/Dedicated_servers/Running_as_a_Service#Docker).
