require_relative 'app.rb'

task :render_html do
  app = App.new
  app.render_index_html
end

# task "rm" do
#   sh "s3cmd --recursive ls s3://holly.mehakovic | awk '{ print $4 }' | grep -v './logs/' | grep -v './AWSLogs' | grep -v './logs_cloud_front/' | xargs s3cmd del"
# end

task :upload do
  sh 's3_website push'
end

task push: [:render_html, :upload]