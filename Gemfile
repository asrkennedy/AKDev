# If you have OpenSSL installed, we recommend updating
# the following line to use "https"
source 'http://rubygems.org'

ruby '2.0.0'

gem "rack-contrib"
gem "puma"

gem "middleman", "~>3.1.5"
gem "haml"
gem "slim"
gem "sass"
gem "better_errors"
gem "binding_of_caller"
gem "middleman-sync", "~> 3.0.12"
gem "middleman-favicon-maker", "~> 3.2"

gem "middleman-deploy"

# Live-reloading plugin
gem "middleman-livereload", "~> 3.1.0"

# For faster file watcher updates on Windows:
gem "wdm", "~> 0.1.0", :platforms => [:mswin, :mingw]

# Cross-templating language block fix for Ruby 1.8
platforms :mri_18 do
  gem "ruby18_source_location"
end