# Please copy/paste all three classes into this file to submit your solution!

class Author
  attr_reader :name
  
  def initialize(name)
    @articles = []
    @magazines = []
    if name.is_a?(String)
      @name = name
    else
      raise InitializationError
    end
  end

  def articles
    @articles
  end

  def magazines
    @magazines.uniq
  end

  def add_article(magazine, title)
    if(magazine.is_a?(Magazine) && title.is_a?(String))
      @articles << Article.new(self, magazine, title)
      @magazines << magazine
    else
      raise ArgumentError
    end
  end

  def topic_areas
    @magazines.map {|magazine| magazine.category}.uniq
  end

  class InitializationError < ArgumentError
    def message
      "Expected a string for the author name"
    end
  end
end


#-------------------------------------------------------------------------------------------------------

class Magazine
  attr_accessor :name, :category
  @@all = []
  
  
  def initialize(name, category)
    if (name.is_a?(String) && category.is_a?(String))
      @name = name
      @category = category
      @@all << self
    else
      raise InitializationError
    end
  end

  def contributors
    articles = Article.all.filter {|article| article.magazine == self}
    articles.map {|article| article.author}
  end

  def article_titles
    articles_in_this_magazine.map {|article| article.title}
  end

  def self.find_by_name(name)
    @@all.find {|magazine| magazine.name == name}
  end

  def contributing_authors
    all_authors = articles_in_this_magazine.map {|article| article.author}
    uniq_authors = all_authors.uniq

    uniq_authors.filter {|author| all_authors.count(author) > 2}
  end

  def self.all
    @@all
  end

  private
  def articles_in_this_magazine
    Article.all.filter {|article| article.magazine == self}
  end

  class InitializationError < ArgumentError
    def message
      "Expected a string and a string for name and category."
    end
  end
end


#-------------------------------------------------------------------------------------------------------

class Article
    attr_reader :title
    @@all = []

    def initialize(author, magazine, title)
        if(author.is_a?(Author) && magazine.is_a?(Magazine) && title.is_a?(String))
            @author = author
            @magazine = magazine
            @title = title

            @@all << self
        else
            raise InitializationError
        end
    end

    def author
        @author
    end

    def magazine
        @magazine
    end

    def self.all
        @@all
    end

    class InitializationError < ArgumentError
        def message
            "Expected an Author, Magazine, and String for author, magazine, and title arguments, respectively"
        end
    end

end
