FROM ubuntu:18.04 as ubuntu-base

WORKDIR /usr/src/gccsdk

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y libtool patch wget help2man autogen m4 gcc g++ bison flex subversion gperf sed make build-essential autoconf2.13 automake cvs doxygen dpkg-dev gettext intltool libglib2.0-dev liborbit2-dev libpopt-dev pkg-config policykit-1 rman subversion unzip wget xsltproc texinfo git libx11-dev tcl subversion

FROM ubuntu-base as builder

COPY ./gcc4 gcc4

COPY ./gccsdk-params gcc4

COPY ./gcc.Makefile.in.p gcc4/recipe/patches/gcc/gcc.Makefile.in.p

ARG NUMPROC=1
ARG MAKEFLAGS

RUN cd gcc4 && ./build-world

FROM ubuntu-base

ENV PATH=/opt/gccsdk/cross/bin:${PATH}

WORKDIR /usr/src

COPY --from=builder /opt/gccsdk /opt/gccsdk
COPY ./gccsdk-params /opt/gccsdk

CMD /bin/bash 
