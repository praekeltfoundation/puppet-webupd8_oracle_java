source 'https://rubygems.org'

group :test do
  puppetversion = ENV.key?('PUPPET_VERSION') ? "#{ENV['PUPPET_VERSION']}" : ['>= 3.0.0','< 4.0']
  gem 'puppet', puppetversion

  gem 'librarian-puppet'
end
