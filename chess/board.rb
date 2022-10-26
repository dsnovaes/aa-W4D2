Dir["*.rb"].each {|file| require_relative file }

class Board
    attr_accessor :rows 

    def initialize
        @rows = Array.new(8) {Array.new(8,nil)}
        @rows[0] = 
        [Rook.new(:black, self, [0,0]),
        Knight.new(:black, self, [0,1]),
        Bishop.new(:black, self, [0,2]),
        Queen.new(:black, self, [0,3]),
        King.new(:black, self, [0,4]),
        Bishop.new(:black, self, [0,5]),
        Knight.new(:black, self, [0,6]),
        Rook.new(:black, self, [0,7])]

        8.times do |i|
            @rows[1][i] = Pawn.new(:black, self, [1,i]) 
            @rows[6][i] = Pawn.new(:white, self, [6,i]) 
        end

        @rows[7] = 
        [Rook.new(:white, self, [7,0]),
        Knight.new(:white, self, [7,1]),
        Bishop.new(:white, self, [7,2]),
        Queen.new(:white, self, [7,3]),
        King.new(:white, self, [7,4]),
        Bishop.new(:white, self, [7,5]),
        Knight.new(:white, self, [7,6]),
        Rook.new(:white, self, [7,7])]
        
    end

    def [](pos)
        row,col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row,col = pos
        @rows[row][col] = val
    end

    def move_piece(start_pos,end_pos)

        if valid_pos?(start_pos) && valid_pos?(end_pos)
            self[end_pos] = self[start_pos]
            self[start_pos] = nil # if there is a piece at selected pos, delete it from the board
        else
            raise RuntimeRrror.new("That move is not valid") 
        end

    end

    def valid_pos?(pos)
        pos.first.between?(0,7) && pos.last.between?(0,7)
    end

end


#      # error when no piece at pos
#      raise RuntimeRrror.new("no piece at selected position") if self[start_pos] == nil
#      # error when try to place off the board
#      raise RuntimeRrror.new("declare position within the board") unless start_pos.first.between?(0,7) && start_pos.last.between?(0,7) && end_pos.first.between?(0,7) && end_pos.last.between?(0,7)
#  end