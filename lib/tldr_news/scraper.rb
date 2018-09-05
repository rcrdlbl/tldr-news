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
      new_article = {
        headline: listing.css('h1.title').text,
        contents: listing.css('div.summary').text,
        url: listing.css('a').attribute('href').value,
        time: listing.css('time').text
      }
      TldrNews::Article.new(new_article)
    end
  end
end
