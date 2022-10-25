require_relative "piece"

class Board
    attr_accessor :rows 

    def initialize
        empty = Array.new(8) {Array.new(8,nil)}
        @rows = empty.map.with_index do |row,i|
            row.each_with_index do |pos,j|
                if i == 0 || i == 1 || i == 6 || i == 7
                    empty[i][j] = Piece.new
                end
            end
        end
        
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
        # error when no piece at pos
        raise RuntimeRrror.new("no piece at selected position") if self[start_pos] == nil

        # error when try to place off the board
        raise RuntimeRrror.new("declare position within the board") unless start_pos.first.between?(0,7) && start_pos.last.between?(0,7) && end_pos.first.between?(0,7) && end_pos.last.between?(0,7)
        self[end_pos] = self[start_pos]
        self[start_pos] = nil # if there is a piece at selected pos, delete it from the board


    end

end