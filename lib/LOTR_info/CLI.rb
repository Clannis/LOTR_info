class LOTRInfo::CLI

    attr_accessor :movie_selection, :character_selection

    def call
        LOTRInfo::APIManager.new
        LOTRInfo::APIManager.get_books
        LOTRInfo::APIManager.get_movies
        LOTRInfo::APIManager.get_characters
        main_menu
    end

    def main_menu

        puts ""
        puts "Welcome to all your LOTR (Lord Of The Rings) info needs!\n\n"
        puts " - To list all of the LOTR books, enter 'list books'."
        puts " - To list all of the movies, enter 'list movies'."
        puts " - To list all of the characters in the LOTR universe, enter 'list characters'."
        puts " - To leave the application, enter 'exit' at any time."
        puts "\n\n"
        user_input = gets.strip
        
        if user_input == "list books" || user_input == "list movies" || user_input == "list characters" || user_input == "exit"
            case user_input
            when "list books"
                list_books
                main_menu
            when "list movies"
                list_movies
                main_menu
            when "list characters"
                list_characters
                main_menu
            when "exit"
                puts "Hope you had your fill. Goodbye!"
                exit
            end
        else
            puts "Invalid Response"
            main_menu
        end


    end

    def list_books
        puts ""
        LOTRInfo::Book.print_book_titles
        puts ""
        puts " - To find out how many chapters are in each book, enter the nunmber of the coresponding book."
        puts " - To go back to the main menu, enter 'main menu'."
        user_input = gets.strip
        if user_input == "1" || user_input == "2" || user_input == "3" || user_input == "main menu" || user_input == "back" || user_input == "exit"
            case user_input
            when "1"
                puts "*********************************************************"
                LOTRInfo::Book.print_number_of_chapters_in(1)
                puts "*********************************************************"
                list_books
            when "2"
                puts "*********************************************************"
                LOTRInfo::Book.print_number_of_chapters_in(2)
                puts "*********************************************************"
                list_books
            when "3"
                puts "*********************************************************"
                LOTRInfo::Book.print_number_of_chapters_in(3)
                puts "*********************************************************"
                list_books
            when "main menu" || "back"
                main_menu
            when "exit"
                puts "Hope you had your fill. Goodbye!"
                exit
            end
        else
            puts "Invalid Response"
            list_books
        end
    end

    def list_movies
        puts ""
        LOTRInfo::Movie.print_movie_titles
        puts ""
        puts " - To find out more info about a movie, enter the nunmber of the coresponding movie."
        puts " - To go back to the main menu, enter 'main menu'."
        user_input = gets.strip
        self.movie_selection = user_input.to_i
        if (user_input.to_i > 0 && user_input.to_i < 9) || user_input == "main menu" || user_input == "back" || user_input == "exit"
            if (user_input.to_i > 0 && user_input.to_i < 9)
                list_movie_info_options
            else
                case user_input
                when "main menu" || "back"
                    self.movie_selection = nil
                    main_menu
                when "exit"
                    puts "Hope you had your fill. Goodbye!"
                    exit
                end
            end
        else
            puts "Invalid Response"
            list_movies
        end

    end

    def list_movie_info_options
        puts ""
        puts "\"#{LOTRInfo::Movie.all[(self.movie_selection - 1)].name}\" information options."
        puts ""
        puts " - To show the run time of the movie, enter 'run time'."
        puts " - To show the budget of the movie, enter 'budget'."
        puts " - To show the Box Office Revenue of the movie, enter 'revenue'."
        puts " - To show how many Academy Award Nominations the movie recieved, enter 'nominations'."
        puts " - To show how many Academy Awards the movie won, enter 'awards'."
        if self.movie_selection > 5
            puts " - To show a list of Characters in the movie, enter 'characters'."
        end
        puts " - To go back to select a different movie, enter 'back'."
        puts " - To go back to the main menu, enter 'main menu'."
        user_input = gets.strip
        if (user_input == "run time" || user_input == "budget" || user_input == "revenue" || user_input == "nominations" || user_input == "awards" || user_input == "characters" || user_input == "main menu" || user_input == "back" || user_input == "exit") && self.movie_selection > 5
            case user_input
            when "run time"
                puts "*********************************************************"
                LOTRInfo::Movie.print_runtime_of(self.movie_selection)
                puts "*********************************************************"
                list_movie_info_options
            when "budget"
                puts "*********************************************************"
                LOTRInfo::Movie.print_budget_of(self.movie_selection)
                puts "*********************************************************"
                list_movie_info_options
            when "revenue"
                puts "*********************************************************"
                LOTRInfo::Movie.print_revenue_of(self.movie_selection)
                puts "*********************************************************"
                list_movie_info_options
            when "nominations"
                puts "*********************************************************"
                LOTRInfo::Movie.print_num_of_nominations_for(self.movie_selection)
                puts "*********************************************************"
                list_movie_info_options
            when "awards"
                puts "*********************************************************"
                LOTRInfo::Movie.print_num_of_awards_for(self.movie_selection)
                puts "*********************************************************"
                list_movie_info_options
            when "characters"
                list_movie_character_options
            when "back"
                self.movie_selection = nil
                list_movies
            when "main menu"
                self.movie_selection = nil
                main_menu
            when "exit"
                puts "Hope you had your fill. Goodbye!"
                exit
            end
        elsif (user_input == "run time" || user_input == "budget" || user_input == "revenue" || user_input == "nominations" || user_input == "awards" || user_input == "main menu" || user_input == "back" || user_input == "exit") && self.movie_selection <= 5
            case user_input
            when "run time"
                puts "*********************************************************"
                LOTRInfo::Movie.print_runtime_of(self.movie_selection)
                puts "*********************************************************"
                list_movie_info_options
            when "budget"
                puts "*********************************************************"
                LOTRInfo::Movie.print_budget_of(self.movie_selection)
                puts "*********************************************************"
                list_movie_info_options
            when "revenue"
                puts "*********************************************************"
                LOTRInfo::Movie.print_revenue_of(self.movie_selection)
                puts "*********************************************************"
                list_movie_info_options
            when "nominations"
                puts "*********************************************************"
                LOTRInfo::Movie.print_num_of_nominations_for(self.movie_selection)
                puts "*********************************************************"
                list_movie_info_options
            when "awards"
                puts "*********************************************************"
                LOTRInfo::Movie.print_num_of_awards_for(self.movie_selection)
                puts "*********************************************************"
                list_movie_info_options
            when "back"
                self.movie_selection = nil
                list_movies
            when "main menu"
                self.movie_selection = nil
                main_menu
            when "exit"
                puts "Hope you had your fill. Goodbye!"
                exit
            end
        else
            puts "Invalid Response"
            list_movie_info_options
        end

    end

    def list_movie_character_options
        puts "*********************************************************"
        LOTRInfo::Movie.print_list_of_characters_in(self.movie_selection)
        puts "*********************************************************"
        puts ""
        puts " - If you would like a URL to find out more information about a character, enter the number of that character."
        puts " - To go back to select a different option, enter 'back'."
        puts " - To go back to the main menu, enter 'main menu'."
        user_input = gets.strip
        self.character_selection = user_input.to_i
        if (user_input.to_i > 0 && user_input.to_i <= LOTRInfo::Movie.all[self.movie_selection - 1].characters.length) || user_input == "main menu" || user_input == "back" || user_input == "exit"
            if (user_input.to_i > 0 && user_input.to_i <= LOTRInfo::Movie.all[self.movie_selection - 1].characters.length)
                puts ""
                puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
                puts "Find out more about the character #{LOTRInfo::Movie.all[self.movie_selection - 1].characters[self.character_selection - 1].name} at #{LOTRInfo::Movie.all[self.movie_selection - 1].characters[self.character_selection - 1].wikiUrl}"
                puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
                puts ""
                puts "Would you like to look up another character? (y/n)"
                redo_input = gets.strip
                while redo_input != "y" || redo_input != "n"
                    if redo_input == "y"
                        list_movie_character_options
                    elsif redo_input == "n"
                        self.character_selection = nil
                        list_movie_info_options
                    else
                        puts "Invalid Response"
                        puts ""
                        puts "Would you like to look up another character? (y/n)"
                        redo_input = gets.strip
                    end
                end
            else
                case user_input
                when "main menu"
                    self.character_selection = nil
                    self.movie_selection = nil
                    main_menu
                when "back"
                    self.character_selection = nil
                    list_movie_info_options
                when "exit"
                    puts "Hope you had your fill. Goodbye!"
                    exit
                end
            end
        else
            puts "Invalid Response"
            list_movie_character_options
        end

    end

    def list_characters
        puts "*********************************************************"
        LOTRInfo::Character.print_all_characters
        puts "*********************************************************"
        puts ""
        puts " - If you would like a URL to find out more information about a character, enter the number of that character."
        puts " - To go back to the main menu, enter 'main menu'."
        user_input = gets.strip
        self.character_selection = user_input.to_i
        if (user_input.to_i > 0 && user_input.to_i <= LOTRInfo::Character.all.length) || user_input == "main menu" || user_input == "back" || user_input == "exit"
            if (user_input.to_i > 0 && user_input.to_i <= LOTRInfo::Character.all.length)
                sorted_character_list = LOTRInfo::Character.all.sort_by {|character| character.name}
                puts ""
                puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
                puts "Find out more about the character #{sorted_character_list[self.character_selection - 1].name} at #{sorted_character_list[self.character_selection - 1].wikiUrl}"
                puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
                puts ""
                puts " - If you want to search another character, enter 'next'."
                puts " - If you want to go back to the main menu, enter 'main menu'."
                user_input = gets.strip
                case user_input
                when "next"
                    list_characters
                when "main menu" || "back"
                    self.character_selection = nil
                    main_menu
                when "exit"
                    puts "Hope you had your fill. Goodbye!"
                    exit
                end
            else
                case user_input
                when "main menu" || "back"
                    self.character_selection = nil
                    main_menu
                when "exit"
                    puts "Hope you had your fill. Goodbye!"
                    exit
                end
            end
        else
            puts "Invalid Response"
            list_characters
        end
    end

end

LOTRInfo::CLI.new.call
