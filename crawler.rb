#set encoding=utf-8
require 'nokogiri'
require 'open-uri'
require 'open_uri_redirections'

#LIST 불러오기
url_list = []
1.upto(10).each do |i|
  doc = Nokogiri::HTML(open("https://m.search.naver.com/search.naver?display=15&nso=&query=%EB%8F%84%EC%BF%84%EC%97%AC%ED%96%89&sm=mtb_pge&st=sim&where=m_blog&start=#{i*15 + 1}", 'User-Agent' => 'firefox'))
  links = doc.css(".lst_total a")
  links.each do |link|
    url_list.push(link["href"])
  end
  puts url_list
end


#POST 불러오기
=begin
url_list.each do |url|
  doc = Nokogiri::HTML(open(url, :allow_redirections => :safe))
  html =  doc.css(".se_component_wrap").text
  puts html
  #POST 처리
  html.split("\n").each do |line|
    l = line.strip
    l.gsub!(/<\/?[^>]*>/, "")
    if(l.length > 0)
      puts l
    end
  end
end
=end
