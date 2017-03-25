
FROM debian:jessie

# Install & update base system
RUN apt-get update
RUN apt-get upgrade -y

# Install git and maven
RUN apt-get install -y git wget curl python-dev
RUN apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils
RUN apt-get install -y libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev libzmq3-dev

ENV NODE_VERSION v6

# Install Node.js
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
RUN . ~/.bashrc && nvm install $NODE_VERSION && nvm alias default $NODE_VERSION
RUN . ~/.bashrc && npm install -g node-gyp

RUN mkdir -p /opt/app
COPY ./package.json /opt/app
WORKDIR /opt/app
RUN . ~/.bashrc && npm install --unsafe-perm=true
COPY . /opt/app
ENV NODE_ENV=production
CMD . ~/.bashrc && npm start
