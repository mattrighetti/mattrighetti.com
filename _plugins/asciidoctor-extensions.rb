require 'asciidoctor/extensions'

include Asciidoctor

Asciidoctor::Extensions.register do
  block :chat do
    process do |parent, reader, attributes|
      character = attributes.values[1]
      
      svg = File.read("_includes/" + character + ".svg")
      content = reader.lines.join(' ')

      html = %(
        <div class="dialog #{character}" title="#{character.capitalize}">
          <div class="dialog-head">
          #{svg}
          </div> 
          <div class="dialog-text">
          <p>#{content}</p>
          </div>
        </div>
      )
      
      create_pass_block parent, html, {}, :content_model => :raw
    end
  end
end