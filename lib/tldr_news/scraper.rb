require 'pry'
class TldrNews::Scraper

  def initialize
  end
  
  def get_page
    Nokogiri::HTML(open('https://tldrworldnews.com/'))
  end

  def scrape_articles
    self.get_page.css('div.listing')
  end

  def make_articles
    scrape_articles.each do |listing|
      TldrNews::Article.new_from_html(listing)
    end
  end
end
