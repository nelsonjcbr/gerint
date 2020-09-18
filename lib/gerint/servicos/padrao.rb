require 'json'
require 'date'

module Gerint

    class Padrao 

        def obj_to_hash(object = self, hash = {})
            object.each_pair do |key, value|
                hash[key] = value
            end
            hash
        end

        def obj_to_json(object = self)
            self.obj_to_hash(object).to_json
        end
    end

end
