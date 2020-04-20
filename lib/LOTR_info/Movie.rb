class LOTRInfo::Movie

    extend Create::ClassMethods
    include Create::InstanceMethods

    @@all = []

    def self.all
        @@all
    end



    attr_accessor :name, :_id, :runtimeInMinutes, :budgetInMillions, :boxOfficeRevenueInMillions, :academyAwardNominations, :academyAwardWins, :series
    attr_reader :characters

    def initialize(hash)
        @@flag = false
        @quotes = []
        @characters = []
        hash.each do |k,v|
            self.send("#{k}=", v)
        end
        if self.name.include?("Series")
            @series = true
        else
            @series = false
        end
    end

    def self.find_by_id(id)
        @@all.find {|movie| movie._id == id}
    end

    def self.print_movie_titles
        @@all.each_with_index do |movie, index|
            puts "#{index + 1}. #{movie.name}"
        end
    end

    def self.print_runtime_of(movie_index)
        movie = @@all[movie_index - 1]
        run_hours = (movie.runtimeInMinutes / 60)
        run_mins = (movie.runtimeInMinutes % 60)
        puts ""
        puts "\"#{movie.name}\" is #{run_hours} hours and #{run_mins} minutes long."
    end

    def self.print_budget_of(movie_index)
        movie = self.all[movie_index - 1]
        puts ""
        puts "The budget to make \"#{movie.name}\" was $#{movie.budgetInMillions} millon."
    end

    def self.print_revenue_of(movie_index)
        movie = self.all[movie_index - 1]
        puts ""
        puts "\"#{movie.name}\" made $#{movie.boxOfficeRevenueInMillions} millon at the box office."
    end

    def self.print_num_of_nominations_for(movie_index)
        movie = self.all[movie_index - 1]
        puts ""
        puts "\"#{movie.name}\" was nominated for #{movie.academyAwardNominations} Academy Award(s)!"
    end

    def self.print_num_of_awards_for(movie_index)
        movie = self.all[movie_index - 1]
        puts ""
        puts "\"#{movie.name}\" won #{movie.academyAwardWins} Academy Award(s)!"
    end

    def self.print_list_of_characters_in(movie_index)
        # LOTRInfo::Quote.get_quotes
        movie = self.all[movie_index - 1]
        LOTRInfo::Quote.get_movie_quote(movie._id)
        puts "The characters that appear in \"#{movie.name}\" are:"
        movie.characters.each_with_index do |character, index|
            puts "#{index + 1}. #{character.name}"
        end

    end

    def add_character(character)
        if !self.characters.include?(character)
            self.characters << character
        end
    end

    

end
