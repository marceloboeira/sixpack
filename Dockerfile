FROM ubuntu:16.04

MAINTAINER Marcelo Boeira <me+docker@marceloboeira.com>

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    python-dev python-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install sixpack
RUN pip install --upgrade pip
RUN pip install setuptools
RUN pip install sixpack

# Mount the config folder
VOLUME /config/

ENV SIXPACK_PORT=7000
ENV SIXPACK_CONFIG=/config/config.yml
EXPOSE 7000

CMD sixpack
