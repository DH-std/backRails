# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.



# equire 'securerandom'

# def secure_token
# 	token_file = Rails.root.join('.secret')
# 	if File.exist?(token_file)
# 		# Use the existing token.
#     	File.read(token_file).chomp
#  	else
#     	# Generate a new token and store it in token_file.
#     	token = SecureRandom.hex(64)
#     	File.write(token_file, token)
#     	token
#   	end
# end

# BackRails::Application.config.secret_key_base = secure_token

BackRails::Application.config.secret_key_base = '3bc453a88805a9d649b6a0b5e8187062ccd6b5792c3b2f04f4b2dc3ccb50a9dc6fd6ef6aaff0c57b688aca718473fe736f3e24a45bbe017fe1dc9e7b1050bffd'
