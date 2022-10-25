require_relative "piece"
require_relative "slideable"
require_relative "board"
class Rook < Piece

    include Slideable

    def initialize(color, board, pos)
        super
    end

end

# g = Board.new

# tower = Rook.new(:white,g,[0,5])

# p tower.horizontal_dirs