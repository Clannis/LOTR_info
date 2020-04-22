class LOTRInfo::Character

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

    attr_accessor :name, :gender, :realm, :race, :_id, :height, :birth, :spouse, :death, :hair, :wikiUrl, :movies

    def initialize(hash)
        @movies = []
        hash.each do |k,v|
            if v == "" || v ==" " || v == nil
                self.send("#{k}=", "*** Data not provided ***")
            else
                self.send("#{k}=", v)
            end
        end
        if @wikiUrl == nil
            @wikiUrl = "*** No URL  provided ***"
        end
    end

    def self.find_by_id(id)
        @@all.find {|character| character._id == id}
    end

    def self.find_by_name(name)
        a = @@all.find {|character| character.name == name}
        binding.pry
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
            result += "#{self.name} did not appear in any movies."
        end
        result
    end

    def self.get_characters
        if self.flag == false
            LOTRInfo::APIManager.get_characters
            self.flag = true
        end
    end

end