require 'will_paginate'

module WillPaginate
  	module ViewHelpers
    # This class does the heavy lifting of actually building the pagination
    # links. It is used by +will_paginate+ helper internally.
	    class LinkRenderer < LinkRendererBase
	    	 # def to_html
		     #    html = pagination.map do |item|
		     #      item.is_a?(Fixnum) ?
		     #        page_number(item) :
		     #        send(item)
		     #    end.join(@options[:link_separator])
		        
		     #    @options[:container] ? html_container(html) : html
		     #  end


	    	protected

	    	def gap
			  tag(:li, "...", :class => "gap")
			end

			def page_number(page)
				if page == current_page
					tag(:li, page, :class => "current")
				else
					tag(:li, link(page, page, rel: rel_value(page)))
				end
			end

			def previous_or_next_page(page, text, classname)
				if page
					tag(:li, link(text, page), :class => classname)
				else
					tag(:li, tag(:span, text), :class => "#{classname} disabled")
				end
			end

			def html_container(html)
				tag(:ul, html, container_attributes)
			end
	    end
	end
end