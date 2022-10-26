require_relative "board"
require_relative "piece"


class NullPiece < Piece

    def initialize(color, board, pos)
        super
    end

    def moves
        #in UML diagram -- what does this do?
    end

end