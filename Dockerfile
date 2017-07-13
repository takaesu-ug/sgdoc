FROM ruby:latest
MAINTAINER Yuji Takaesu <taka.esu.user@gmail.com>

RUN gem install sgdoc

ENTRYPOINT ["sgdoc"]
CMD [""]
