#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "apply-templates.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

FROM buildpack-deps:focal

ARG DEBIAN_FRONTEND=noninteractive

# skip installing gem documentation
RUN set -eux; \
	mkdir -p /usr/local/etc; \
	{ \
		echo 'install: --no-document'; \
		echo 'update: --no-document'; \
	} >> /usr/local/etc/gemrc

ENV LANG C.UTF-8
ENV RUBY_MAJOR 3.1
ENV RUBY_VERSION 3.1.2
ENV RUBY_DOWNLOAD_SHA256 ca10d017f8a1b6d247556622c841fc56b90c03b1803f87198da1e4fd3ec3bf2a

RUN wget -O ruby.tar.xz https://cache.ruby-lang.org/pub/ruby/${RUBY_MAJOR%-rc}/ruby-$RUBY_VERSION.tar.xz && \
		mkdir -p /usr/src/ruby && \
		tar -xJf ruby.tar.xz -C /usr/src/ruby --strip-components=1 && \
		rm ruby.tar.xz && \
		cd /usr/src/ruby && \
		./configure --disable-install-doc && \
		make -j "$(nproc)" && \
		make install && \
		cd / && \
		rm -r /usr/src/ruby

# verify we have no "ruby" packages installed
RUN if dpkg -l | grep -i ruby; then exit 1; fi;
RUN [ "$(command -v ruby)" = '/usr/local/bin/ruby' ]; \
		ruby --version; \
		gem --version; \
		bundle --version

# don't create ".bundle" in all our apps
ENV GEM_HOME /usr/local/bundle
ENV BUNDLE_SILENCE_ROOT_WARNING=1
ENV BUNDLE_APP_CONFIG="$GEM_HOME"
ENV PATH $GEM_HOME/bin:$PATH
# adjust permissions of a few directories for running "gem install" as an arbitrary user
RUN mkdir -p "$GEM_HOME" && chmod 777 "$GEM_HOME"

CMD [ "irb" ]
