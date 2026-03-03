# Test the build
sudo docker build -t test-build -f Dockerfile .

# Build and run
sudo docker compose up -d --build

# Get nextcloud setup password
sudo docker exec nextcloud-aio-mastercontainer cat /mnt/docker-aio-config/data/configuration.json | grep password
