# ruby-ubuntu

## update version
```sh
make version
```

## apply templates

```sh
make templates
```



## Supported tags and respective Dockerfile links
- [3.2.0-preview1 , 3.2.0-preview1-jammy , 3.2.0-preview1-22.04](https://github.com/acidtib/ruby-ubuntu/blob/main/3.2-rc/jammy/Dockerfile)
- [3.2.0-preview1-focal , 3.2.0-preview1-20.04](https://github.com/acidtib/ruby-ubuntu/blob/main/3.2-rc/focal/Dockerfile)
- [3.1.2-jammy , jammy , 3.1.2-22.04 , 3.1.2 , 3.1 , 3 , latest](https://github.com/acidtib/ruby-ubuntu/blob/main/3.1/jammy/Dockerfile)
- [3.1.2-focal , focal , 3.1.2-20.04](https://github.com/acidtib/ruby-ubuntu/blob/main/3.1/focal/Dockerfile)
- [3.0.4 , 3.0 , 3.0.4-jammy , 3.0.4-22.04](https://github.com/acidtib/ruby-ubuntu/blob/main/3.0/jammy/Dockerfile)
- [3.0.4-focal , 3.0.4-20.04](https://github.com/acidtib/ruby-ubuntu/blob/main/3.0/focal/Dockerfile)

# How to use this image
## Create a Dockerfile in your Ruby app project

```
FROM acidtib/ruby-ubuntu:3.1.2

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["./your-daemon-or-script.rb"]
```