require 'rubygems'
require 'nokogiri'
require 'open-uri'

module ScrapWorm
   
   def scrap(options={})  
     cartoons_arr = []
     #the first page
     #raise ArgumentError options[:url] 
     page = Nokogiri::HTML(open(options[:url]))
     #get total pages
     total_pages = page.css("div.pages>strong")[0].text
     #puts "---total--pages---#{total_pages}"
     nodes = page.css("div.paihang>ul li")               
     puts "----------->#{nodes.length}" 
     # #title
     # puts "----first--> #{nodes[0].css('b a').text}" 
     # #detail url
     # puts "-----details---> #{nodes[0].css('b a')[0]['href']}"
     # #thumb picture url     
     # puts "----first-thumb-> #{nodes[0].css('a img')[0]['src']}"   
     host = options[:url].split('/sexiaozu/')[0]
     nodes.each_with_index do |cartoon, index|
        detail_url = Nokogiri::HTML(open( host + nodes[index].css('b a')[0]['href'] )).css("img.maximg")[0]['src']
        thumb_url = nodes[index].css('a img')[0]['src']
        CartoonTmp.create(
          title: nodes[index].css('b a').text,
          details_url: detail_url.include?("http") ? detail_url : host + detail_url,
          thumb_pic_url: thumb_url.include?("http") ? thumb_url : host + thumb_url
        )
     end
    
      
     #the left pages 
     (total_pages.to_i - 1).times do |index|        
         curr_page =  Nokogiri::HTML(open(options[:url] + "list_#{index+2}.html"))  
          nodes = curr_page.css("div.paihang>ul li") 
          nodes.each_with_index do |cartoon, index|
              detail_url = Nokogiri::HTML(open( host + nodes[index].css('b a')[0]['href'] )).css("img.maximg")[0]['src']
              thumb_url = nodes[index].css('a img')[0]['src']
              CartoonTmp.create(
                title: nodes[index].css('b a').text,
                details_url: detail_url.include?("http") ? detail_url : host + detail_url,
                thumb_pic_url: thumb_url.include?("http") ? thumb_url : host + thumb_url
              )
           end              
          # puts "----------->#{nodes.length}" 
          #           #title
          #           puts "----first--> #{nodes[0].css('b a').text}" 
          #           #detail url
          #           puts "-----details---> #{nodes[0].css('b a')[0]['href']}"
          #           #thumb picture url     
          #           puts "----first-thumb-> #{nodes[0].css('a img')[0]['src']}"     
     end  
     return cartoons_arr
     # puts " page========> #{cartoons_arr.inspect}"   
     # cartoon = Cartoon.new(thumbnail: open(cartoons_arr[0][:thumb_pic_url]), title: cartoons_arr[0][:title])
     # cartoon.save
   end

   def save_sexiaozu(cartoon_tmp_id)

    begin
      cartoon_tmp = CartoonTmp.find(cartoon_tmp_id)
      cartoon = Cartoon.create({
        title: cartoon_tmp.title,
        download_number: (10000..20000).to_a.sample,
        cost_money: (15..20).to_a.sample,
        thumb_pic: open(cartoon_tmp.thumb_pic_url),
        original_pic: open(cartoon_tmp.details_url)
      })
    cartoon.save && cartoon_tmp.update_attributes({scraped: true}) if cartoon.valid?
    return cartoon.id
    rescue => ex
      puts "^^^^^^^^^ #{ex.inspect}"
      return false
    end
   end
   
end