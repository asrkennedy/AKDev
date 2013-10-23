###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

activate :relative_assets

set :relative_links, true

set :layout, false

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Reload the browser automatically whenever files change
activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

require 'slim'

activate :directory_indexes

set :build_dir, "build"

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do

  activate :sync do |sync|
    sync.fog_provider = 'AWS' # Your storage provider
    sync.fog_directory = 'welosttherobots.com' # Your bucket name
    sync.fog_region = 'us-east-1' # The region your storage bucket is in (eg us-east-1, us-west-1, eu-west-1, ap-southeast-1 )
    sync.aws_access_key_id = ENV['AWS_ACCESS_KEY_ID']# Your Amazon S3 access key
    sync.aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY'] # Your Amazon S3 access secret
    sync.existing_remote_files = 'keep' # What to do with your existing remote files? ( keep or delete )
    # sync.gzip_compression = false # Automatically replace files with their equivalent gzip compressed version
    # sync.after_build = false # Disable sync to run after Middleman build ( defaults to true )
  end

activate :favicon_maker

activate :deploy do |deploy|
  deploy.method = :rsync
  # host and path *must* be set
  deploy.host = "www.welosttherobots.com"
  deploy.path = "/srv/www/site"
  # user is optional (no default)
  deploy.user = "asrkennedy"
  # port is optional (default is 22)
  deploy.port  = 22
  # clean is optional (default is false)
  deploy.clean = true
end

  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
