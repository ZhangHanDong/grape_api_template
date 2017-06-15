app_root = ENV.fetch("APP_ROOT") { ::File.expand_path('../../', __FILE__) }
pidfile "#{app_root}/tmp/pids/puma.pid"
daemonize false
port 9292
environment ENV.fetch("RACK_ENV") { "development" }
workers (ENV["workers"] || 4)
threads (ENV["min_threads"] || 8), (ENV["max_threads"] || 8)
preload_app!


on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end

before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
end
