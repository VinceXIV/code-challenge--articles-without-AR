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