# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'uwc-work'
set :repo_url, 'git@github.com:mitkouwcad/uwcbg.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/rails/uwc-work"

# restart app by running: touch tmp/restart.txt
# at server machine
set :passenger_restart_with_touch, true

set :puma_threads,    [4, 16]

set :rbenv_type, :user
set :rbenv_ruby, '2.3.0'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :ssh_options, {
  keys: %w(/Users/mitko/.ssh/mitko_uwc),
  forward_agent: false,
}
