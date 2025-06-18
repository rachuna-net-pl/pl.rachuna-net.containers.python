FROM ubuntu:noble

ARG CONTAINER_VERSION="0.0.0"

LABEL Author='Maciej Rachuna'
LABEL Application='pl.rachuna-net.containers.semantic-release'
LABEL Description='semantic-release container image'
LABEL version="${CONTAINER_VERSION}"

COPY scripts/ /opt/scripts/

# Install packages
RUN apt-get update && apt-get install -y \
        ca-certificates \
        curl \
        git \
        gnupg2 \
        jq \
        lsb-release \
        python3 \
        python3-pip \
        python3-setuptools \
        python3-venv \
        python-is-python3 \
        software-properties-common \
        openssh-client \
    && chmod +x /opt/scripts/*.bash

ENTRYPOINT [ "/opt/scripts/entrypoint.bash" ]