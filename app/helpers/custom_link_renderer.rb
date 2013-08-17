class CustomLinkRenderer < WillPaginate::LinkRenderer
  def page_link(page, text, attributes = {})
    @template.link_to text, "#{@template.url_for(@url_params)}/page/#{page}", attributes
  end
end