# demucs_deploy

Requirements:
    - Docker (or podman)
    - Docker Compose (or podman compose)

To get started run the setup.sh script, it will download the 4 models being used (demucs, demucs_extra, tasnet, tasnet_extra). It will configure the directory to have the right SELinux permissions.

After running the script, run:

    docker-compose build
    docker-compose up

A webpage will be lunch on port 3000. To interact with the service, there is a graphql interface on port 5000.