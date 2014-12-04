#!/bin/bash
mkdir rails_app/shared
mkdir rails_app/shared/log
mkdir rails_app/shared/pids
mkdir rails_app/config
cp config/server/unicorn.rb rails_app/config/unicorn.rb
