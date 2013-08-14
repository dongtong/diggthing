#-*- coding: utf-8 -*-
require 'rubygems'
require 'nokogiri'
require 'open-uri'

module ScrapWorm
  
   def scrap_sexiaozu_res(options={})  
     cartoons_arr = []
     begin

      sexiaozu = ScrapSource.where('name=?', options[:name]).first_or_create!(
        name: options[:name], 
        src_url: options[:url]
      )

      if sexiaozu.total_pages.nil? || sexiaozu.curr_page <= sexiaozu.total_pages
        curr_scrap_page = sexiaozu.curr_page
        if sexiaozu.curr_page.nil? || sexiaozu.curr_page == 1
          #the first page
          page = Nokogiri::HTML(open(sexiaozu.src_url))
          sexiaozu.curr_page = 2
        else
          #from page 2 start
          page = Nokogiri::HTML(open("http://xiaojiulou.com/sexiaozu/list_#{curr_scrap_page}.html"))
          sexiaozu.curr_page += 1
        end

        #get total pages
        total_pages = page.css("div.pages>strong")[0].text
        sexiaozu.total_pages = total_pages if sexiaozu.total_pages != total_pages
        # when current page nodes saved, then update scrap source object
        sexiaozu.save 
        #the first page per cartoon, it should be 18           
        nodes = page.css("div.paihang>ul li")   
        #title => nodes[0].css('b a').text
        #detail url => nodes[0].css('b a')[0]['href']
        #thumb picture url => nodes[0].css('a img')[0]['src']

        #get page nodes
        host = options[:url].split(/\/sexiaozu/)[0]
        nodes.each_with_index do |cartoon, index|
          title = nodes[index].css('b a').text

          thumb_url = nodes[index].css('a img')[0]['src']
          detail_url = Nokogiri::HTML(open( host + nodes[index].css('b a')[0]['href'])).css("img.maximg")[0]['src']
          unless CartoonTmp.find_by_title(title).present? #avoid next time iterator cycle create same object
            CartoonTmp.create(
              title: title,
              details_url: detail_url.include?("http") ? detail_url : host + detail_url,
              thumb_pic_url: thumb_url.include?("http") ? thumb_url : host + thumb_url,
              scraped: false,
              scrap_page: curr_scrap_page
            )
          end
        end
      end#sexiaozu.total_pages.nil? || sexiaozu.curr_page <= sexiaozu.total_pages

      return cartoons_arr
    rescue => ex
      Rails.logger.info ex.inspect
      return cartoons_arr
    end
   end

   def generate_title(title)
    if title.include?(':') || title.include?('：')
      title.split(/[:：]/)[1] 
    else
      title
    end
   end

   def save_sexiaozu(cartoon_tmp_id)
    begin
      cartoon_tmp = CartoonTmp.find(cartoon_tmp_id)
      cartoon = Cartoon.create({
        title: generate_title(cartoon_tmp.title),
        download_number: (10000..20000).to_a.sample,
        cost_money: (15..20).to_a.sample,
        thumb_pic: open(cartoon_tmp.thumb_pic_url),
        original_pic: open(cartoon_tmp.details_url)
      })
    cartoon.save && cartoon_tmp.update_attributes({scraped: true}) if cartoon.valid?
    return cartoon.id
    rescue => ex
      Rails.logger.info("#{ex.inspect}")
      return false
    end
   end
   
end