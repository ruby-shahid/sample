server 'ubuntu@ec2-13-126-182-184.ap-south-1.compute.amazonaws.com', user: 'deploy', roles: %w{web app db}

# set :ssh_options, {
#   keys: %w(~/.ssh/id_rsa, ~/.ssh/abc),
#   forward_agent: true,
#   auth_methods: %w(publickey)
# }

set :puma_env, 'development'
set :nginx_server_name, 'ubuntu@ec2-13-126-182-184.ap-south-1.compute.amazonaws.com'