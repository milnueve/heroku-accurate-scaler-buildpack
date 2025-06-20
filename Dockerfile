FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y curl jq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV HOME=/home
WORKDIR /home/buildpack
COPY . .

RUN mkdir /home/app
RUN mkdir /home/cache
RUN mkdir /home/env

RUN ./bin/detect /home/app
RUN ./bin/compile /home/app /home/cache /home/env
