ARG BZMINER_VERSION=v14.1.1
ARG CUDA_VERSION=11.8.0
ARG OS_VERSION=ubuntu20.04

FROM nvidia/cuda:${CUDA_VERSION}-base-${OS_VERSION} as nvidia
ARG BZMINER_VERSION

RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  curl \
  wget \
  tar \
  ca-certificates

  RUN mkdir /bzminer && wget -O bzminer.tar.gz https://github.com/bzminer/bzminer/releases/download/${BZMINER_VERSION}/bzminer_${BZMINER_VERSION}_linux.tar.gz  \
    && tar xvf bzminer.tar.gz --strip-components 1 -C /bzminer

ENTRYPOINT ["/bzminer/bzminer"]