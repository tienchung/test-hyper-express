# test-hyper-express

# Create image
docker build -t hyper-express .

# Run service
docker run -p 8080:80 --cpus=1.0 --memory=1g image_name

# Run test
wrk -c 100000 -d 30 http://localhost:8080

## hyper-express
1271716 requests in 30.19s, 105.51MB read


# Linux
## display information about your OS and architecture
uname -a

## lists the sizes of all files within folder and sort result in reverse order (-r) and in a human-readable format (-h)
du -ah /path/to/folder | sort -rh
- -s: This option summarizes the total disk usage of each specified file or directory.
- -a: This option displays the disk usage of each file individually, not just directories.
- -h: This option displays the sizes in a human-readable format (e.g., KB, MB, GB).

# Docker
## Run a container with an interactive shell and deleting it after you're finished
docker run --rm -it image_name /bin/sh

## Open interactive shell session within a running container
docker exec -it image_name /bin/sh

## Verify Docker CPU Usage
docker inspect [container-name] | grep NanoCpus
