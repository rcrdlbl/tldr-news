require 'pry'
class TldrNews::Scraper
  def get_page
    Nokogiri::HTML(open('https://tldrworldnews.com/'))
  end

  def scrape_articles
    self.get_page.css('div.listing')
    binding.pry
  end

  def make_articles

  end
end
