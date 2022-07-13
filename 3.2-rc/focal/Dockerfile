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
ENV RUBY_MAJOR 3.2-rc
ENV RUBY_VERSION 3.2.0-preview1
ENV RUBY_DOWNLOAD_SHA256 6d28477f7fa626b63bf139afd37bcfeb28fce6847b203fa10f37cb3615d0c35d

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
