FROM ubuntu:trusty

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y python-software-properties software-properties-common
RUN add-apt-repository -y ppa:chris-lea/node.js

RUN apt-get update && apt-get install -y \
    build-essential git htop tmux pv \
    postgresql libpq-dev \
    python-pip python-dev libjpeg-dev zlib1g-dev \
    nodejs

RUN npm install -g grunt-cli bower

ADD requirements.txt /src/
WORKDIR /src

RUN pip install -r requirements.txt

ADD package.json bower.json .bowerrc /src/
RUN npm install

RUN bower install --allow-root

ADD setup.py manage.py Makefile /src/
ADD example /src/example
ADD scripts /src/scripts
RUN python setup.py develop

ADD Gruntfile.coffee /src/
RUN grunt

RUN make create_database
RUN make make_fixtures

EXPOSE 80

CMD ["./manage.py", "runserver", "0.0.0.0:80"]
