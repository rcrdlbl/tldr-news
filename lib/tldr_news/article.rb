class TldrNews::Article
  attr_accessor :headline, :contents, :url, :time
  @@all = []

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(input)
    @@all[input.to_i - 1]
  end

end
