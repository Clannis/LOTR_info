class LOTRInfo::Book

    extend Create::ClassMethods
    include Create::InstanceMethods

    @@all = []

    def self.all
        @@all
    end

    attr_accessor :name, :_id
    attr_reader :chapters # instance variables requiring custom writers

    def initialize(hash) # only called when creating books from api
        @chapters = {} # must be an empty hash on instantiation to contain all chapters of the book
        hash.each do |k,v|
            self.send("#{k}=", v)
        end
    end

    #each chapter is saved into the instance variable specified 

    def add_chapters(array_of_hashes)
        array = format_chapters(array_of_hashes)
        array.sort.each_with_index do |chapter_id_num, index|
            @chapters["chapter_#{index + 1}".to_sym] = {chapter_id: chapter_id_num}
            
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
        self.all.each_with_index do |book, index|
            puts "#{index + 1}. #{book.name}"
        end
    end

    def self.print_number_of_chapters_in(book_index)
        book = self.all[book_index - 1]
        LOTRInfo::APIManager.get_chapters_of(book)
        puts "There are #{book.chapter_id.count} chapters in \"#{book.name}\"."
    end

    def self.print_chapter_list(book_index)
        book = self.all[book_index - 1]
        book.chapter_id.each do |chapter_number, id|
            puts "#{chapter_number.to_s}"
        end
    end

    def self.print_chapter(chapter_id)
        self.chapters.each do |chapter_num, hash|
            hash.each do |k,v|
                if k[:chapter_id] == chapter_id
                    puts "#{k[:chapter_details]}"
                end
            end
        end
    end

    def add_chapter_details(chapter_id)
        self.chapters.each do |chapter_num, hash|
            hash.each do |k,v|
                if k[:chapter_id] == chapter_id
                    k[:chapter_details] = LOTRInfo::APIManager.get_chapter(chapter_id)
                end
            end
        end
    end

end


