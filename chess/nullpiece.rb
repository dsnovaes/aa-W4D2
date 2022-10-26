require_relative "piece"
require "singleton"


class NullPiece < Piece
    include Singleton
    attr_reader :color, :board

    def initialize
        #(color, board)
        # super
    end

    def moves
        #in UML diagram -- what does this do?
    end

end