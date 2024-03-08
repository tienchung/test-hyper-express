# test-hyper-express

# Create image
docker build -t hyper-express .

# Run a container with an interactive shell and deleting it after you're finished
docker run --rm -it image_name /bin/sh

# Run service
docker run -p 8080:80 --cpus=1.0 --memory=1g image_name
