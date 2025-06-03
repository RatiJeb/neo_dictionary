module ApplicationHelper
  include Pagy::Frontend
  def pagy_custom_nav(pagy)
    html = +""
    return html if pagy.series.size <= 1

    if pagy.prev
      html << link_to(url_for(page: pagy.prev), class: "px-4 py-2 bg-neo-dark hover:bg-neo-dark-hover text-white rounded") do
        image_tag("chevron-left-light.svg", alt: "Previous", class: "h-4 w-4")
      end
    else
      html << content_tag(:span, image_tag("chevron-left-light.svg", alt: "Previous", class: "h-4 w-4 opacity-50"), class: "px-4 py-2 bg-gray-300 text-gray-600 rounded cursor-not-allowed")
    end

    pagy.series.each do |item|
      case item
      when Integer
        html << link_to(item, url_for(page: item), class: "px-3 py-1 border rounded hover:bg-neo")
      when String
        html << content_tag(:span, item, class: "px-3 py-1 border-neo-dark border rounded hover:bg-neo")
      when :gap
        html << content_tag(:span, "...", class: "px-3 py-1 border rounded hover:bg-neo")
      when :current
        html << content_tag(:span, item, class: "px-3 py-1 border border-neo-dark bg-neo-dark text-white rounded")
      end
    end

    if pagy.next
      html << link_to(url_for(page: pagy.next), class: "px-4 py-2 bg-neo-dark hover:bg-neo-dark-hover text-white rounded") do
        image_tag("chevron-right-light.svg", alt: "Next", class: "h-4 w-4")
      end
    else
      html << content_tag(:span, image_tag("chevron-right-light.svg", alt: "Next", class: "h-4 w-4 opacity-50"), class: "px-4 py-2 bg-gray-300 text-gray-600 rounded cursor-not-allowed")
    end

    content_tag(:nav, html.html_safe, class: "flex space-x-2 justify-center mt-4")
  end
end
