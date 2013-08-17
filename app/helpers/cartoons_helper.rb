module CartoonsHelper
	def show_pre_next_link(curr_nav, curr_cartoon)
		link_str = '<ul class="pager">'
		pre_cartoon_sta = "disabled" unless Cartoon.where("id=?",curr_cartoon.id - 1).present?
		next_cartoon_sta = "disabled" unless Cartoon.where("id=?",curr_cartoon.id + 1).present?
		link_str << content_tag(:li, class: "previous #{pre_cartoon_sta}") do
			content_tag(:a, href: pre_cartoon_sta == 'disabled' ? '#' : show_cartoons_path(curr_nav, curr_cartoon.id - 1)) do
				raw "&larr;#{I18n.t("cartoons.detail.pre")}"
			end
		end
		link_str << content_tag(:li, class: "next #{next_cartoon_sta}") do
			content_tag(:a, href: next_cartoon_sta == 'disabled' ? '#' : show_cartoons_path(curr_nav, curr_cartoon.id + 1)) do
				raw "#{I18n.t("cartoons.detail.next")}&rarr;"
			end
		end
		link_str << "</ul>"
	end

end
