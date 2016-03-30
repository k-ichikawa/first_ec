

class Card < ActiveRecord::Base
end

=begin
require 'rubygems'

require 'initializer'
require 'active_record'


ActiveRecord::Base.establish_connection(
    "adapter" =>"sqlite3",
    "database" => "card.db"
)

require 'selenium-webdriver'
require 'open-uri'
require 'nokogiri'

	driver = Selenium::WebDriver.for :firefox
	url = 'http://ws-tcg.com/cardlist/?cardno=AOT/S35-001'
	(1..10).each do |i|
		charset = nil
		html = open(url) do |f|	  
			charset = f.charset # 文字種別を取得
	  		f.read # htmlを読み込んで変数htmlに渡す
		end
		doc = Nokogiri::HTML.parse(html, nil, charset)
		
		Card.create(:product => doc.css('h3').first.inner_text,
						:name => doc.css('.first > td:nth-child(3)').inner_text.split("\x0D\x0A")[1],
						:kana => doc.css('.first > td:nth-child(3)').inner_text.split("\x0D\x0A")[2],
						:num => doc.css('.cell_2').inner_text,
						:rarity => doc.css('.cell_4').inner_text,
						:image => doc.css('.graphic > img').attribute('src').value
						)
		driver.navigate.to url
		driver.manage.timeouts.implicit_wait = 3
		begin
			driver.find_element(:partial_link_text => "次のカード").click
		rescue
			break;
		end

		url = driver.current_url
	end
	driver.quit
=end
	
