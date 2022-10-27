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

  def self.all
    @@all
  end

  class InitializationError < ArgumentError
    def message
      "Expected a string and a string for name and category."
    end
  end
end