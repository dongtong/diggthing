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

    def show_comment_form(cartoon_id)
      form_str = ''
      result = form_for(Comment.new, :url => comments_create_path, :html => {:class => "form-horizontal"}) do |f|
          form_str << hidden_field_tag('comment[cartoon_id]', cartoon_id)
          form_str << hidden_field_tag('comment[user_id]', current_user.id)
          #The following way will generate illegal characters
          #text_area_tag('comment[content]', nil, class: 'form-control col-lg-10', id: 'comment_content', rows: 4)
          form_str << '<textarea class="form-control col-lg-10" id="comment_content" name="comment[content]" rows="4"></textarea>'
          form_str << submit_tag(I18n.t("cartoons.detail.comments.add_comment_btn"), :class => 'btn btn-primary', :id => 'add_comment')
          raw form_str
      end
    end

    def show_comment_login_info
      comment_btn = ""
      comment_btn << content_tag(:a, href: new_user_session_path, class: "btn btn-primary") do
        I18n.t("cartoons.detail.comments.btn_login")
      end 
      comment_btn <<  I18n.t("cartoons.detail.comments.other")
      comment_btn << content_tag(:a, href: new_user_registration_path, class: "btn btn-success") do
        I18n.t("cartoons.detail.comments.btn_signin")
      end
    end
end
