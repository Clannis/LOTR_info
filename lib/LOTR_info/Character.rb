class LOTRInfo::Character

    extend Create::ClassMethods
    include Create::InstanceMethods

    @@all = []

    def self.all
        @@all
    end

    attr_accessor :name, :gender, :realm, :race, :_id, :height, :birth, :spouse, :death, :hair, :wikiUrl, :movies

    def initialize(hash)
        @movies = []
        hash.each do |k,v|
            if v == "" || v ==" " || v == nil
                self.send("#{k}=", "***Data not provided***")
            else
                self.send("#{k}=", v)
            end
        end
        
    end

    def self.find_by_id(id)
        @@all.find {|character| character._id == id}
    end

    def self.find_by_name(name)
        @@all.find {|character| character.name == name}
    end

    def add_movie(movie)
        if !self.movies.include?(movie)
            self.movies << movie
        end
    end

    def self.print_all_characters
        LOTRInfo::Character.all.sort_by {|character| character.name}.each_with_index do |character, index|
            puts "#{index + 1}. #{character.name}"
        end
    end

    def print_movies
        result = "Movies: "
        if self.movies.length != 0
            self.movies.each_with_index do |movie, index|
                if index + 1 != self.movies.length
                    result += "#{movie.name}, "
                else
                    result += "#{movie.name}"
                end
            end
        else
            result += "#{self.name} did not appear in any movies"
        end
        result
    end

end