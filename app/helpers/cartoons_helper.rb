module CartoonsHelper
	def show_pre_next_link(curr_nav, curr_cartoon)
		link_str = ""
		if Cartoon.where("id=?",curr_cartoon.id - 1).present?
			link_str << content_tag(:a, href: show_cartoons_path(curr_nav, curr_cartoon.id - 1), class: "btn btn-primary first-btn") do
				I18n.t("cartoons.detail.pre")
			end
		end

		if Cartoon.where("id=?",curr_cartoon.id + 1).present?
			link_str << content_tag(:a, href: show_cartoons_path(curr_nav, curr_cartoon.id + 1), class: "btn btn-primary last-btn") do
				I18n.t("cartoons.detail.next")
			end
		end
		link_str
	end

end
