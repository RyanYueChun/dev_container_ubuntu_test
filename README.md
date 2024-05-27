# Rust devevelopment environment
docker build -t rust_install .
docker run -it --rm rust_install

docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock rust_install



# Start Postgre
docker run -d \
	--name some-postgres \
	-e POSTGRES_PASSWORD=mysecretpassword \
	-e PGDATA=/var/lib/postgresql/data/pgdata \
	-e POSTGRES_INITDB_ARGS=AZURE_DATA \
	-v /custom/mount:/var/lib/postgresql/data \
	postgres

NOTE : Instead of mounting the volume directly to /var/lib/postgresql, mount it to another directory like /var/lib/postgresql/pgdata.	