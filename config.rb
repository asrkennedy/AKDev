###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end
activate :directory_indexes

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

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do

    if ENV.include?('DEPLOY')
    activate :s3_deploy do |s3|
      s3.access_key_id = ENV['AWS_ACCESS_KEY_ID']
      s3.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
      s3.bucket = ENV['AWS_S3_BUCKET']
    end
    activate :invalidate_cloudfront do |cf|
      cf.access_key_id = ENV['AWS_ACCESS_KEY_ID']
      cf.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
      cf.distribution_id = ENV['AWS_CLOUDFRONT_DIST_ID']
    end
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
