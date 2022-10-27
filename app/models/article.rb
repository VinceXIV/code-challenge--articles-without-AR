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

    def self.all
        @@all
    end


    class InitializationError < ArgumentError
        def message
            "Expected an Author, Magazine, and String for author, magazine, and title arguments, respectively"
        end
    end

end
