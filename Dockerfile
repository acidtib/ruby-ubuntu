FROM acidtib/ruby-ubuntu-base:latest

ARG RUBY_PATH=/usr/local/
ARG RUBY_VERSION=3.1.2

RUN git clone https://github.com/rbenv/ruby-build.git $RUBY_PATH/plugins/ruby-build \
		&& $RUBY_PATH/plugins/ruby-build/install.sh

RUN ruby-build $RUBY_VERSION $RUBY_PATH

ENV PATH $RUBY_PATH/bin:$PATH

CMD [ "irb" ]