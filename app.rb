require 'haml'
require 'ostruct'
require 'redcarpet'
require 'byebug'

class App
  attr_reader :haml

  def initialize
    @haml = File.read(File.open('index.haml', 'r'))
  end

  def render_index_html
    index = File.open('index.html', 'w')
    index << html
    index.close
  end

  # private

  def html
    Haml::Engine.new(haml).render(Object.new, folio: folio)
  end

  def folio
    items = Dir["#{Dir.pwd}/folio/*"]
    items.inject([]) do |folio, item|
      folio << Parser.new(item).data
      folio
    end
  end
end

class Parser
  attr_reader :meta, :body

  def initialize(file)
    file  = File.open(file, 'r')
    split = file.read.split('----')
    @meta = parse_meta(split[1])
    @body = parse_body(split[2])
  end

  def data
    return meta if meta.body
    meta.body = body
    meta
  end

  private

  def parse_meta(string)
    meta_split = string.split(/\n/)
    OpenStruct.new(
      title:            meta_split[1].match(/: (.+)/)[1],
      subtitle:         meta_split[2].match(/: (.+)/)[1],
      cute_description: meta_split[3].match(/: (.+)/)[1],
      description:      meta_split[4].match(/: (.+)/)[1],
      date:             meta_split[5].match(/: (.+)/)[1],
      category:         meta_split[6].match(/: (.+)/)[1],
      image:            meta_split[7].match(/: (.+)/)[1]
    )
  end

  def parse_body(string)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = { strikethrough: true })
    markdown.render(string)
  end
end