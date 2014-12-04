FROM ubuntu:latest

RUN apt-get update -q
RUN apt-get install -qy nginx
RUN apt-get install -qy curl
RUN apt-get install -qy nodejs

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN curl -sSL https://get.rvm.io | bash -s stable
# -c run the command passed to the -c argument
# -l makes it a login shell so bash first reads /etc/profile
RUN /bin/bash -c "source /etc/profile.d/rvm.sh"
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.1.2"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"

ADD config/container/nginx.conf /etc/nginx/sites-enabled/default
ADD config/container/start-server.sh /usr/bin/start-server
RUN chmod +x /usr/bin/start-server

RUN mkdir /opt/web_app
WORKDIR /opt/web_app

ADD Gemfile /opt/web_app/Gemfile
ADD Gemfile.lock /opt/web_app/Gemfile.lock

RUN /bin/bash -l -c "bundle install"

ADD . /opt/web_app

EXPOSE 80

ENTRYPOINT /usr/bin/start-server
