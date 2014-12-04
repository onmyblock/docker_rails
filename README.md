### Setup
```
$ ./initial_setup.sh
$ cd rails_app
$ rails new .
```
Then add `gem "unicorn"` to your Gemfile.

### Development
```
$ boot2docker start
$ boot2docker ip
$ fig up
```
Go to [ip_address]:3000 (ip address from `$ boot2docker ip`).

### Stop development processes
```
$ docker rm -f $(docker ps -a)
```

### Production
```
$ docker build -t [tag_name] .
$ docker run -d -p 3000:80 [tag_name]
```
