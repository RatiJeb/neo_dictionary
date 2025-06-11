module WordsHelper
  def highlight_qualifications(content, short_names_map)
    return content unless content.present?

    doc = Nokogiri::HTML::DocumentFragment.parse(content)

    doc.traverse do |node|
      next unless node.text?

      text = node.content.dup

      short_names_map.each do |short, full|
        regex = /(?<=\b)#{Regexp.escape(short)}(?=\s)/

        text.gsub!(regex) do |match|
          <<~HTML.chomp
            <i class="text-green-700 text-m italic underline decoration-dotted" title="#{ERB::Util.h(full)}">
              #{ERB::Util.h(match)}
            </i>
          HTML
        end
      end

      node.replace(text) if text != node.content
    end

    doc.to_html.html_safe
  end
end
