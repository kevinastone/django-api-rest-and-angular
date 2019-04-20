FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_11.x  | bash -

RUN apt-get update && apt-get install -y \
    build-essential git htop tmux pv \
    python3 python3-pip python3-dev libjpeg-dev zlib1g-dev \
    nodejs

RUN npm install -g grunt-cli bower

ADD requirements.txt /src/
WORKDIR /src

RUN pip3 install -r requirements.txt

ADD package.json bower.json .bowerrc /src/
RUN npm install

RUN bower install --allow-root

ADD setup.py manage.py Makefile /src/
ADD example /src/example
ADD scripts /src/scripts
RUN python3 setup.py develop

ADD Gruntfile.coffee /src/
RUN grunt

RUN make create_database
RUN make make_fixtures

EXPOSE 80

CMD ["./manage.py", "runserver", "0.0.0.0:80"]
