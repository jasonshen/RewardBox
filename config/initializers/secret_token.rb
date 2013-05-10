# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.

if Rails.env.development? || Rails.env.test?
  # https://github.com/GreenplumChorus/chorus/
  # For development || test environments
  # Uses a file called secret.token which holds the token
  # We utilize a rake task - generate_secret_token - to generate this file if it doesn't exist
  token_file = Rails.root.join('config/secret.token')
  abort "!! No config/secret.token file found. Please run \"rake development:generate_secret_token\"" unless token_file.exist?

  RewardBox::Application.config.secret_token = token_file.read
elsif Rails.env.production?
  abort "!! No secret token found. Run export REWARDBOX_TOKEN=`rake secret`" unless ENV['REWARDBOX_TOKEN']

  RewardBox::Application.config.secret_token = ENV['REWARDBOX_TOKEN']
end
