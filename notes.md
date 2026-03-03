# Test the build
sudo docker build -t test-build -f Dockerfile .

# Build and run
sudo docker compose up -d --build