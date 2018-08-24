class TldrNews::Article
  attr_accessor :headline, :contents, :url, :time
  @@all = []

  def initialize(headline = nil, contents = nil, url = nil, time = nil)
    @url = url
    @contents = contents
    @headline = headline
    @time = time
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_from_html(listing)
    self.new(
    listing.css('h1.title').text,
    listing.css('div.summary').text,
    listing.css('a').attribute('href').value,
    listing.css('time').text
    )
  end

  def self.find(input)
    @@all[input.to_i - 1]
  end



end
