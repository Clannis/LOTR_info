class LOTRInfo::Quote

    extend Create::ClassMethods
    include Create::InstanceMethods

    @@all = []
    @@flag = false

    def self.all
        @@all
    end

    def self.flag
        @@flag
    end

    def self.flag=(state)
        @@flag = state
    end

    attr_accessor :dialog, :_id, :movie, :character

    def initialize(hash)
        hash.each do |k,v|
            if v == ""
                self.send("#{k}=", nil)
            else
                self.send("#{k}=", v)
            end
        end
        
        @character = LOTRInfo::Character.find_by_id(@character)
        @movie = LOTRInfo::Movie.find_by_id(@movie)
        
        @movie.add_character(@character)
        @character.add_movie(@movie)
        
    end

    def self.find_by_id(id)
        @@all.find {|quote| quote._id == id}
    end

    def self.find_by_character(character)
        @@all.find {|quote| quote.character == character}
    end

    def self.find_by_movie(movie)
        @@all.find {|movie| movie.character == character}
    end
    
    def self.get_quotes
        if self.flag == false
            LOTRInfo::APIManager.get_quotes
            self.flag = true
        end
    end


end