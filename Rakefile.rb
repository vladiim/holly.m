require_relative 'app.rb'

task :render_html do
  app = App.new
  app.render_index_html
end

task :upload do
  sh 's3_website push'
end

task push: [:render_html, :upload]