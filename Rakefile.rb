require_relative 'app.rb'

task :render_html do
  app = App.new
  app.render_index_html
end

task :upload do
  # sh 's3_website push'
  sh 'aws s3 cp index.html s3://holly.mehakovic.com --region us-east-1'
  sh 'aws s3 sync images s3://holly.mehakovic.com/images --region us-east-1'
end

task push: [:render_html, :upload]
