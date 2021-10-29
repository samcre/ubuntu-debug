FROM ubuntu:20.04

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends ca-certificates dnsutils net-tools curl netcat redis traceroute gnupg wget vim postgresql-client mysql-client iputils-ping \
    && wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add - \
    && echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list \
    && apt-get update && apt-get install --no-install-recommends -y mongodb-mongosh \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
