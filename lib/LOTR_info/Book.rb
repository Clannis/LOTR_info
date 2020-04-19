class LOTRInfo::Book

    extend Create::ClassMethods
    include Create::InstanceMethods

    @@all = []

    def self.all
        @@all
    end

    attr_accessor :name, :_id
    attr_reader :chapter_id # instance variables requiring custom writers

    def initialize(hash) # only called when creating books from api
        @chapter_id = {} # must be an empty hash on instantiation to contain all chapters of the book
        hash.each do |k,v|
            self.send("#{k}=", v)
        end
    end

    #each chapter is saved into the instance variable specified 

    def add_chapters(array_of_hashes)
        array = format_chapters(array_of_hashes)
        array.sort.each_with_index do |chapter_id, index|
            @chapter_id["chapter_#{index + 1}".to_sym] = chapter_id
            
        end
    end

    def format_chapters(array_of_hashes)
        array = []
        array_of_hashes.each do |hash|
            hash.each do |k,v|
                if k == "_id"
                    array << v
                end
            end
        end
        array
    end

    def self.print_book_titles
        @@all.each_with_index do |book, index|
            puts "#{index + 1}. #{book.name}"
        end
    end

    def self.print_number_of_chapters_in(book_index)
        book = @@all[book_index - 1]
        LOTRInfo::APIManager.get_chapters_of(book)
        puts "There are #{book.chapter_id.count} chapters in \"#{book.name}\"."
    end


end


