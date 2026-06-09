require_relative 'app.rb'

# The holly.mehakovic.com bucket lives in AWS account 598950110404.
# Deploys use the `holly` CLI profile (aws configure --profile holly).
# The site is served over HTTPS via CloudFront (distribution E261BJ5WUIH5XF),
# so a cache invalidation is needed after each upload for changes to show.
AWS       = 'aws --region us-east-1 --profile holly'.freeze
BUCKET    = 's3://holly.mehakovic.com'.freeze
CF_DIST_ID = 'E261BJ5WUIH5XF'.freeze

task :render_html do
  app = App.new
  app.render_index_html
  app.render_old_html
end

task :upload do
  sh "#{AWS} s3 cp index.html #{BUCKET}"
  sh "#{AWS} s3 cp old.html #{BUCKET}"
  sh "#{AWS} s3 sync images #{BUCKET}/images"
end

task :invalidate do
  sh "#{AWS} cloudfront create-invalidation --distribution-id #{CF_DIST_ID} --paths '/*'"
end

task push: [:render_html, :upload, :invalidate]
