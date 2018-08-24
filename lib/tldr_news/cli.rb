class TldrNews::CLI
  def call
    puts "TLDR NEWS:"
    TldrNews::Scraper.new.make_articles
  end

  def start
    headline_list
    puts ""
    puts "If you'd like to read more about a headline, enter it's number."
    puts "Otherwise type exit"
    menu
    puts ""
    puts "Thanks Bye!"
    exit
  end

  def headline_list
    #this will put out a list of headlines
    TldrNews::Article.all.each.with_index(1) do |article, index|
      puts "#{index}. #{article.headline}"
    end
  end

  def article_info(article)
    puts article.headline
    puts ""
    puts article.contents.strip
    puts ""
    puts "To read even more, visit #{article.url}"
    puts "Posted #{article.time}"
  end

  def menu
      input = gets.strip
      if input == ""
        puts ""
        puts "I don't get it."
      else
        puts ""
        art = TldrNews::Article.find(input)
        article_info(art)
        puts ""
      end
      again?
  end

  def again?
    puts "Read another article? (y/n)"
    input = nil
    while input != "n"
      input = gets.strip
      if input == "y"
        start
      end
    end
  end

end
