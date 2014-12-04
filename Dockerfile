FROM ubuntu:12.04

RUN apt-get update -q
RUN apt-get install -qy nginx
RUN apt-get install -qy curl
RUN apt-get install -qy nodejs

RUN curl -sSL https://rvm.io/mpapis.asc | gpg --import -
RUN curl -sSL https://get.rvm.io | bash -s stable
# -c run the command passed to the -c argument
# -l makes it a login shell so bash first reads /etc/profile
RUN /bin/bash -c "source /etc/profile.d/rvm.sh"
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.1.2"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"

RUN mkdir /opt/web_app
WORKDIR /opt/web_app

RUN mkdir /opt/web_app/shared
RUN mkdir /opt/web_app/shared/log
RUN mkdir /opt/web_app/shared/pids

ADD rails_app/Gemfile /opt/web_app/Gemfile
ADD rails_app/Gemfile.lock /opt/web_app/Gemfile.lock
RUN /bin/bash -l -c "bundle install"

ADD rails_app /opt/web_app

ADD config/server/nginx.conf /etc/nginx/sites-enabled/default
ADD config/server/start-server.sh /usr/bin/start-server
ADD config/server/unicorn.rb /opt/web_app/config/unicorn.rb
RUN chmod +x /usr/bin/start-server
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

EXPOSE 80

ENTRYPOINT /usr/bin/start-server
