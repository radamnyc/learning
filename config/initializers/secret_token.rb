# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end
DineApp::Application.config.secret_key_base = secure_token
#DineApp::Application.config.secret_token = '73278eb3972dc35f285cd6605fc676b932dd6f6bbe09111a4f0c50d1e6361688d504f6a48c07ecc098c4e6ba9cf491e9a6dcb061a6cef05f27f880888710be02'
