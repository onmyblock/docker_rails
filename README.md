### Setup
Add `gem "unicorn"` to your Gemfile.

### Production
```
$ docker build -t [tag_name] .
$ docker run -d -p 3000:80 [tag_name]
```

### Development
```
$ fig up
```
