require_relative "board"
require_relative "piece"

module Slideable



    # this is checking for nil and it needs to check for nullpiece, come back and fix it







    def horizontal_dirs
        up_to_down + left_to_right
    end


    def up_to_down # vertical
        resarr = []
        up = []
        down = []
        my_col,my_row = @pos
        
        @board.rows.transpose[my_row].each_with_index do |pos,i|
            if i < my_col 
                up << [i,my_row]
            elsif i > my_col
                down << [i,my_row]
            end
        end

        up.reverse_each do |pos|
            # p pos
            if @board[pos] == nil # pos.class == NullPiece
                p "if is nil"
                resarr << pos
            elsif @board[pos].color == @color
                p "if color is same"
                break
            else
                p "else"
                resarr << pos
                break
            end
        end

        down.each do |pos|
            if @board[pos] == nil # pos.class == NullPiece
                p "if is nil"
                resarr << pos
            elsif @board[pos].color == @color
                p "if color is same"
                break
            else
                p "else"
                resarr << pos
                break
            end
        end

        resarr
    end

    def left_to_right # horizontal
        resarr = []
        left = []
        right = []
        my_row,my_col = @pos
        
        @board.rows[my_row].each_with_index do |pos,i|
            if i < my_col 
                left << [my_row,i]
            elsif i > my_col
                right << [my_row,i]
            end
        end

        left.reverse_each do |pos|
            if @board[pos] == nil # pos.class == NullPiece
                resarr << pos
            elsif @board[pos].color == @color
                break
            else
                resarr << pos
                break
            end
        end

        right.each do |pos|
            if @board[pos] == nil # pos.class == NullPiece
                resarr << pos
            elsif @board[pos].color == @color
                break
            else
                resarr << pos
                break
            end
        end

        resarr

    end
end


# [0..starting]

# [starting..-1]




# [:black,:white,:white,nil,nil,:white]

# [[0,1],[0,3],[0,4]]


# possible moves
# 