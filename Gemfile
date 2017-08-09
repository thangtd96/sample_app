source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
gem "rails", "~> 5.0.5"
gem "sqlite3"
gem "puma", "~> 3.0"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "jquery-rails"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "bcrypt", "~> 3.1", ">= 3.1.11"
group :development, :test do
  gem "byebug", platform: :mri
  gem "rspec-rails"
  gem "factory_girl_rails", "~> 4.8"
end

group :test do
    gem "faker"
    gem "capybara"
    gem "database_cleaner"
    gem "launchy"
    gem "selenium-webdriver"
    gem "shoulda-matchers", "~> 3.0", require: false
    gem "rails-controller-testing"
    gem "rspec-html-matchers"
  end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "twitter-bootstrap-rails"
gem "config", "~> 1.4"
