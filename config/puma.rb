workers Integer(ENV['PUMA_WORKERS'] || 2)
threads_min = Integer(ENV['PUMA_MIN_THREADS'] || 5)
threads_max = Integer(ENV['PUMA_MAX_THREADS'] || 5)
threads threads_min, threads_max

# preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

# on_worker_boot do
#   # Worker specific setup for Rails 4.1+
#   # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
#   ActiveRecord::Base.establish_connection
# end