# Cache the kubo image
FROM ipfs/kubo:v0.25.0@sha256:0c17b91cab8ada485f253e204236b712d0965f3d463cb5b60639ddd2291e7c52 AS ipfs-kubo

# Create the base image
FROM debian:12.6-slim@sha256:39868a6f452462b70cf720a8daff250c63e7342970e749059c105bf7c1e8eeaf

# Add curl to the base image (7.88.1-10+deb12u6)
# Add jq to the base image (1.6-2.1)
RUN sed -i 's/URIs/# URIs/g' /etc/apt/sources.list.d/debian.sources && \
	sed -i 's/# http/URIs: http/g' /etc/apt/sources.list.d/debian.sources && \
	apt-get update -o Acquire::Check-Valid-Until=false && apt-get install -y curl=7.88.1-10+deb12u6 jq=1.6-2.1

# Install kubo and initialize ipfs
COPY --from=ipfs-kubo /usr/local/bin/ipfs /usr/local/bin/ipfs

# Copy app into container
COPY ./app /export

# Store the hash to a file in the container
RUN ipfs init
RUN ipfs add --cid-version 1 --quieter --only-hash --recursive /export > ipfs_hash.txt

# print the hash for good measure in case someone is looking at the build logs
RUN cat ipfs_hash.txt

# --------------------------------------------------------
# Publish Script: Option to host app locally or on nft.storage
# --------------------------------------------------------

COPY <<'EOF' /entrypoint.sh
#!/bin/sh
set -e

if [ $# -ne  1 ]; then
	echo "Example usage: docker container run --rm ghcr.io/CrystalBallBe/Augur.Guide-for-IPFS:latest docker-host"
	exit  1
fi

case $1 in

	docker-host)
		# Show the IFPS build hash
		echo "Build Hash: $(cat /ipfs_hash.txt)"

		# Determine the IPV4 address of the docker-hosted IPFS instance
		IPFS_IP4_ADDRESS=$(getent ahostsv4 host.docker.internal | grep STREAM | head -n 1 | cut -d ' ' -f 1)

		echo "Adding files to docker running IPFS at $IPFS_IP4_ADDRESS"
		IPFS_HASH=$(ipfs add --api /ip4/$IPFS_IP4_ADDRESS/tcp/5001 --cid-version 1 --quieter -r /export)
		echo "Uploaded Hash: $IPFS_HASH"
		;;

	*)
		echo "Invalid option: $1"
		echo "Example usage: docker container run --rm ghcr.io/CrystalBallBe/Augur.Guide-for-IPFS:latest docker-host"
		exit  1
		;;
esac
EOF

RUN chmod u+x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
