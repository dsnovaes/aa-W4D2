require_relative "piece"

class Board
    attr_accessor :rows 

    def initialize
        empty = Array.new(8) {Array.new(8,nil)}
        
        # if i == 0 || i == 1 || i == 6 || i == 7

        @rows = empty
    end

end