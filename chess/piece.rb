class Piece

    attr_accessor :pos
    attr_reader :color, :board

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        # we don't know what this for
        # maybe later
    end

    def empty?
        #piece is empty when removed?
        @pos.empty?
    end

    def valid_moves(start_pos,end_pos)
        raise RuntimeRrror.new("no piece at selected position") if @board[start_pos] == nil
        raise RuntimeRrror.new("declare position within the board") unless start_pos.first.between?(0,7) && start_pos.last.between?(0,7) && end_pos.first.between?(0,7) && end_pos.last.between?(0,7) 
    end
end