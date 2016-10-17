tests: setup units printSuccess

units:
	@rspec

bundle:
	@bundle install

printSuccess:
	@./bin/printSuccess.sh

setup:
	@rails db:migrate RAILS_ENV=test

deploy:
	@cf push beertime
