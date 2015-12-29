require 'yaml'

app_dir = File.expand_path('..', File.dirname(__FILE__))
cfg_file = File.join(app_dir, 'config', 'unicorn.yml')
environment = ENV.fetch('RAILS_ENV', 'development')
config = YAML.load_file(cfg_file)[environment]

preload_app true
working_directory app_dir
worker_processes config['workers']

pid File.join(app_dir, config['pid'])
listen File.join(app_dir, config['listen']), backlog: config['backlog']

stdout_path File.join(app_dir, config['stdout']) if config['stdout']
stderr_path File.join(app_dir, config['stderr']) if config['stderr']

before_fork do |_server, _worker|
  pid_file_lock = File.join(app_dir, config['pid_lock'])
  f = File.open(pid_file_lock, 'w')
  exit unless f.flock(File::LOCK_SH)
  defined?(ActiveRecord::Base) && ActiveRecord::Base.connection.disconnect!
end

after_fork do |_server, _worker|
  defined?(ActiveRecord::Base) && ActiveRecord::Base.establish_connection
end
