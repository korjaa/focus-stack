FROM ubuntu:22.04
ENV DEBIAN_FRONTEND="noninteractive"

ADD docs /tmp/build/docs
ADD src /tmp/build/src
ADD Makefile /tmp/build/

WORKDIR /tmp/build/
RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		gosu \
		libopencv-dev \
		build-essential \
	&& rm -rf /var/lib/apt/lists/* \
	&& make \
	&& make install \
	&& rm -rf /tmp/build \
	&& apt-get purge -y build-essential \
	&& apt-get autoremove -y

ADD entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
