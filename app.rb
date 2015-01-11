require 'haml'

class App
  attr_reader :haml

  def initialize
    @haml = File.read(File.open('index.haml', 'r'))
  end

  def html
    Haml::Engine.new(haml).render
  end

  def render_index_html
    index = File.open('index.html', 'w')
    index << html
    index.close
  end
end