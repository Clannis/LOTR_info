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
            if v == ""
                self.send("#{k}=", nil)
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
        result = ""
        self.movies.each_with_index do |title, index|
            if index + 1 != self.movies.length
                result += "#{title}, "
            else
                result += "#{title}"
            end
        end
        result
    end

end