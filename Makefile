docker.build:
	docker build --rm -t acidtib/ruby-ubuntu:3.1.2 -t acidtib/ruby-ubuntu:3.1 -t acidtib/ruby-ubuntu:3 -t acidtib/ruby-ubuntu:latest -t acidtib/ruby-ubuntu:3.1.2-jammy -t acidtib/ruby-ubuntu:jammy -t acidtib/ruby-ubuntu:3.1.2-22.04 3.1/jammy/
	docker build --rm -t acidtib/ruby-ubuntu:3.1.2-focal -t acidtib/ruby-ubuntu:focal -t acidtib/ruby-ubuntu:3.1.2-20.04 3.1/focal/
	docker build --rm -t acidtib/ruby-ubuntu:3.0.4 -t acidtib/ruby-ubuntu:3.0 -t acidtib/ruby-ubuntu:3.0.4-jammy -t acidtib/ruby-ubuntu:3.0.4-22.04 3.0/jammy/
	docker build --rm -t acidtib/ruby-ubuntu:3.0.4-focal -t acidtib/ruby-ubuntu:3.0.4-20.04 3.0/focal/

docker.push:
	docker image push --all-tags acidtib/ruby-ubuntu

version:
	bash versions.sh

templates:
	bash apply-templates.sh