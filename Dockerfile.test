FROM acidtib/ruby-ubuntu-base:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN wget https://cache.ruby-lang.org/pub/ruby/3.1/ruby-3.1.2.tar.gz && \
		tar xvfz ruby-3.1.2.tar.gz && \
		cd ruby-3.1.2 && ./configure && make && make install

RUN gem install bundler

CMD [ "irb" ]