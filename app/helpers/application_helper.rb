module ApplicationHelper
	def link_to_icon(icon_name, url_or_object, options={})
      	options.merge!({ :class => "icon #{icon_name}" })

      	link_to(image_tag("#{icon_name}.png", { :title => icon_name, :width => "16px", :height => "16px"}),
                        url_or_object,
                        options)
    end

    def display_icon(icon_name, options={})
    	options.merge!({:class => "icon #{icon_name}", :title => icon_name})
    	image_tag("#{icon_name}.png", options)
    end
end
