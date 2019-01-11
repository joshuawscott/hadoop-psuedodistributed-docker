# Hadoop Docker Image
Psuedodistributed hadoop docker image. This is more-or-less following the directions in Hadoop: a definitive guide,
Appendix A for setting up the psuedodistributed system.

Configuration files go in etc, and are mapped into `/hadoop-3.0.3/etc/hadoop/` on the container. If you wish to change
other configuration files, they have to be added into docker-compose.yml and put into the `etc` directory in this repo.

The data directory is mapped to /data in the container

## Usage

The first time, create a data directory (to be shared with the container) and build the docker image
```
mkdir data
docker-compose build
```

Run it:
```
docker-compose up -d
```

after it finishes starting up, you can get a command prompt in the container to run commands:
```
docker-compose exec hadoop bash
```
