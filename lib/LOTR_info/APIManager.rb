class LOTRInfo::APIManager

    BASE_URL = "https://the-one-api.herokuapp.com/v1"


    # BOOKS
    def self.get_books
        res = HTTParty.get(BASE_URL + "/book")
        LOTRInfo::Book.create_from_api(res["docs"])
        # binding.pry
    end

    def self.get_chapters_of(book)
        res = HTTParty.get(BASE_URL + "/book" + "/#{book._id}/chapter",{ headers: {Authorization: "Bearer k5bdWjVClU0LPC78ayLG"}})
        book.add_chapters(res["docs"])
        # binding.pry
    end

    # MOVIES
    def self.get_movies
        res = HTTParty.get(BASE_URL + "/movie", {headers: {Authorization: "Bearer k5bdWjVClU0LPC78ayLG"}})
        LOTRInfo::Movie.create_from_api(res["docs"])
        # binding.pry
    end

    # CHARACTERS
    def self.get_characters
        res = HTTParty.get(BASE_URL + "/character", {headers: {Authorization: "Bearer k5bdWjVClU0LPC78ayLG"}})
        LOTRInfo::Character.create_from_api(res["docs"])
        # binding.pry
    end

    #QUOTES

    def self.get_quotes
        res = HTTParty.get(BASE_URL + "/quote", {headers: {Authorization: "Bearer k5bdWjVClU0LPC78ayLG"}})
        LOTRInfo::Quote.create_from_api(res["docs"])
    end

    def self.get_movie_quotes(movie_id)
        res = HTTParty.get(BASE_URL + "/movie/#{movie_id}/quote", {headers: {Authorization: "Bearer k5bdWjVClU0LPC78ayLG"}})
        LOTRInfo::Quote.create_from_api(res["docs"])
    end

end