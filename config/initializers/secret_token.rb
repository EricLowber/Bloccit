# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Bloccit::Application.config.secret_key_base = ENV['SECRET_KEY_BASE']
# Bloccit::Application.config.secret_key_base = '57a430eff494652d95c02d349d37366681270fc2144b42dec7c7613954b76582a02e4bd8b4af9809011efe9645d2bb2fb84b44cd5576f8aadd616a74a6f61f67'