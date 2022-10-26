require_relative "board"
require_relative "display"

class Game
    def initialize
        @board = Board.new
        @display = Display.new(@board)
    end

    def play
        result = nil
        until result
            @display.render 
            result = @display.cursor.get_input
        end
        result
    end

end

g = Game.new
g.play