require_relative "board"
require_relative "cursor"
require "colorize"

class Display


    attr_reader :board, :cursor

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0],@board )
    end

    def render

        piece_symbols = {
            Pawn => "i",
            Rook => "T",
            Knight => "&",
            Bishop => "B",
            Queen => "Q",
            King => "K",
            NullPiece => " "
        }

        system("clear")
        @board.rows.each_with_index do |row,i|
            puts "  "
            puts "---------------------------------"
            print "|"
            row.each_with_index do |piece,j|

                if [i,j] == @cursor.cursor_pos
                    if @cursor.selected
                        print " #{piece_symbols[piece.class]} ".white.on_blue.blink
                    else
                        print " #{piece_symbols[piece.class]} ".white.on_red.blink
                    end
                    
                else
                    case piece
                        when Pawn
                            print " i "
                        when Rook
                            print " T "
                        when Knight
                            print " & "
                        when Bishop
                            print " B "
                        when Queen
                            print " Q "
                        when King
                            print " K "
                        else
                            print "   "
                    end
                end
                print "|"
            end
        end
        puts "  "
        puts "---------------------------------"
    end

end