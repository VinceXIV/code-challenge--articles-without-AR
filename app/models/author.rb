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

  class InitializationError < ArgumentError
    def message
      "Expected a string for the author name"
    end
  end
end