source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
gem 'rails-i18n'
gem 'http_accept_language'
gem 'sqlite3', '~> 1.3.6'
gem 'puma', '~> 3.12'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
gem 'mini_magick', '~> 4.6.0'
gem 'bourbon', '~> 4.2.7'
gem 'administrate', '~> 0.3.0'
gem 'kaminari'
gem 'carrierwave', '~> 1.0'
gem 'ckeditor', github: 'galetahub/ckeditor'
gem 'activerecord-import'
gem 'database_cleaner'
gem 'devise'
gem 'devise-i18n'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'capistrano', '~> 3.8.2'
  gem 'capistrano-rails', '~> 1.2'
  gem 'capistrano-bundler', '~> 1.2'
  gem 'capistrano-rvm', '~> 0.1'
  gem 'capistrano-rake'
  gem 'capistrano3-puma', '~> 1.2'
  gem 'capistrano-locally'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
end
