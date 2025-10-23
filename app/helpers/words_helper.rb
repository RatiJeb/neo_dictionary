module WordsHelper
  include Pagy::Frontend

  def highlight_qualifications(content, short_names_map)
    return content unless content.present?

    doc = Nokogiri::HTML::DocumentFragment.parse(content)

    doc.traverse do |node|
      next unless node.text?

      text = node.content.dup

      short_names_map.each do |short, hash|
        regex = /(?<=\b)#{Regexp.escape(short)}(?=\s)/

        text.gsub!(regex) do
          <<~HTML.chomp
            <i class="text-green-700 text-m italic underline decoration-dotted" title="#{ERB::Util.h(hash[:full])}">
              #{ERB::Util.h(hash[:short])}
            </i>
          HTML
        end
      end

      node.replace(text) if text != node.content
    end

    doc.to_html.html_safe
  end
end
