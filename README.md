### Setup
```
$ cd rails_app
$ rails new .
```
Then add `gem "unicorn"` to your Gemfile.

### Production
```
$ docker build -t [tag_name] .
$ docker run -d -p 3000:80 [tag_name]
```

### Development
```
$ mkdir rails_app/shared
$ mkdir rails_app/shared/log
$ mkdir rails_app/shared/pids
$ cp config/server/unicorn.rb rails_app/config/unicorn.rb
$ boot2docker start
$ fig up
$ boot2docker ip
```
Go to [ip_address]:3000 (ip address from `$ boot2docker ip`).

### Stop development processes
```
$ docker rm -f $(docker ps -a)
```
