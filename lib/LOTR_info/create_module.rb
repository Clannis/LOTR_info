module Create

    module ClassMethods

        def create_from_api(array_of_hashes)
            array_of_hashes.each do |hash|
                self.create(hash)
            end
        end

        def create_from_api_hash(hash)
            self.create(hash)
        end

        def create(hash)
            instance = self.new(hash)
            instance.save
            instance
        end

    end

    module InstanceMethods

        def save
            self.class.all << self
        end

    end

end