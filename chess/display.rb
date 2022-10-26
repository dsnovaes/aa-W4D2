require_relative "board"
require 'colorize'

class Display

    attr_reader :board

    def initialize
        @board = Board.new
        @cursor
    end

    def render
        @board.rows.each do |row|
            puts "  "
            puts "---------------------------------"
            print "|"
            row.each do |piece|
                # puts piece.class
                case piece
                    when Pawn
                        print " i |"
                    when Rook
                        print " T |"
                    when Knight
                        print " & |"
                    when Bishop
                        print " B |"
                    when Queen
                        print " Q |"
                    when King
                        print " K |"
                    else
                        print "   |"
                end
            end
        end
        puts "  "
        puts "---------------------------------"
    end

end

# pawn i
# rook T
# knights &
# bishops B
# queen Q 
# king K