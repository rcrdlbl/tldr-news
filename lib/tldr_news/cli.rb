class TldrNews::CLI
  def call
    puts "TLDR NEWS:"
    TldrNews::Scraper.new.make_articles
  end

  def start
    headline_list
    puts "If you'd like to read more about a headline, enter it's number."
    puts "Otherwise type exit"
    input = gets.strip
    if input == "exit"
      "Thanks, Bye!"
      exit
    elsif input == ""
      puts "I don't get it."
    else
      art = TldrNews::Article.find(input)
      article_info(art)
    end
  end

  def headline_list
    #this will put out a list of headlines
    TldrNews::Article.all.each.with_index(1) do |article, index|
      puts "#{index}. #{article.headline}"
    end
  end

  def article_info(article)
    #this will show the article with a link to the full article
    puts article.headline
    puts ""
    puts article.contents
    puts "To read even more, visit #{article.url}"
    puts "Posted #{article.time}"
  end

  # def menu
  #   #this will let the user select an article to read more about
  # end
end
