# README

# Ruby 3.0.0
# Depedncies
	- Postgresql 12
	- postgis
	- nodejs
	- yarn
	- webpacker
# Setup
	- copy database.yml.sample to databse.yml and configure with db details
	- Mailer is configured with letter opener in environment can specific the smtp credntials and use it.
	- Use data in rails db:seed to populate default user

# Courier Service
	- Being a public user user can tracl the order using the track id
	- Being an authenticated user, user can create an order
	- On creation an email will send to both sender and receiver of parsel

# To Do
	- Test case
	- Rubocop standards
	- Look and feel
	- autherization
