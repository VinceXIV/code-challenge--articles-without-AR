class Magazine
  attr_accessor :name, :category
  @@all = []
  
  
  def initialize(name, category)
    if (name.is_a?(String) && category.is_a?(String))
      @name = name
      @category = category
      @contributors = []
      @@all << self
    else
      raise InitializationError
    end
  end

  def contributors
    @contributors
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