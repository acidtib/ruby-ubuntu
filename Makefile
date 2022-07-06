build:
	docker build --rm -t ruby-ubuntu .

tag:
	docker tag ruby-ubuntu:latest acidtib/ruby-ubuntu:latest

push:
	docker push acidtib/ruby-ubuntu:latest