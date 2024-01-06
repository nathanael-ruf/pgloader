FROM debian:bookworm-slim as builder
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  bzip2 \
  ca-certificates \
  curl \
  freetds-dev \
  gawk \
  git \
  libsqlite3-dev \
  libssl3 \
  libzip-dev \
  libssl-dev \
  make \
  openssl \
  patch \
  sbcl \
  time \
  unzip \
  wget \
  cl-ironclad \
  cl-babel \
  && rm -rf /var/lib/apt/lists/*

COPY ./bundle-3.6.9 /opt/src/pgloader
WORKDIR /opt/src/pgloader
RUN make


FROM debian:bookworm-slim
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  curl \
  freetds-dev \
  gawk \
  libsqlite3-dev \
  libzip-dev \
  libssl-dev \
  make \
  sbcl \
  unzip \
  && rm -rf /var/lib/apt/lists/*

COPY --from=builder /opt/src/pgloader/bin/pgloader /usr/local/bin

ADD freetds.conf /etc/freetds/freetds.conf