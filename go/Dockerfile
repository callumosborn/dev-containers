FROM debian:bookworm

ARG USERNAME

ARG GROUP

ARG ARCH

ARG GO_VERSION

ARG GO_CHECKSUM

ENV GO111MODULE=on

ENV GOROOT=/usr/local/go

ENV GOBIN=${GOROOT}/bin

ENV GOPATH=/home/${USERNAME}/go

ENV PATH=${PATH}:${GOBIN}

RUN groupadd ${GROUP} && \
  useradd -m ${USERNAME} -g ${GROUP} -s /bin/bash && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
  ca-certificates \
  curl \
  sudo && \
  echo ${USERNAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USERNAME} && \
  chmod 0440 /etc/sudoers.d/${USERNAME} && \
  update-ca-certificates && \
  curl -L "https://go.dev/dl/go${GO_VERSION}.linux-${ARCH}.tar.gz" \
    -o /tmp/go${GO_VERSION}.linux-${ARCH}.tar.gz && \
  echo "${GO_CHECKSUM}  /tmp/go${GO_VERSION}.linux-${ARCH}.tar.gz" | sha256sum -c - && \
  tar -xzf /tmp/go${GO_VERSION}.linux-${ARCH}.tar.gz -C /usr/local && \
  rm /tmp/go${GO_VERSION}.linux-${ARCH}.tar.gz && \
  chown -R ${USERNAME}:${GROUP} ${GOROOT}

USER ${USERNAME}
