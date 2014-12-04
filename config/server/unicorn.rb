app_root          = "/opt/web_app"
# Set the working application directory
# working_directory "/path/to/your/app"
working_directory = "#{app_root}"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "#{app_root}/shared/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "#{app_root}/shared/log/unicorn.stderr.log"
stdout_path "#{app_root}/shared/log/unicorn.stdout.log"

# Unicorn socket
listen "/tmp/unicorn.sock"

# Number of processes
worker_processes 3

# Time-out
timeout 30
