require_relative "board"
require_relative "piece"

class Bishop < Piece

    include Slideable

    def initialize(color, board, pos)
        super
    end

end