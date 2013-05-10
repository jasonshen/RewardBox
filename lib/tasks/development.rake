require 'securerandom'
require 'pathname'
require 'fileutils'

# https://github.com/GreenplumChorus/chorus/
namespace :development do
  desc "Generate config/secret.token which is used for signing cookies"
  task :generate_secret_token do
    secret_token_file = Pathname.new(__FILE__).dirname.join("../../config/secret.token")
    secret_token_file.open("w") { |f| f << SecureRandom.hex(64) } unless secret_token_file.exist?
  end
end
