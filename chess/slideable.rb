require_relative "board"
require_relative "piece"

module Slideable

    def diagonal_dirs
        resarr = []
        diagonal1 = []
        diagonal2 = []
        diagonal3 = []
        diagonal4 = []
        my_col,my_row = @pos

        i = 0
        while i < @board.rows.length
     
            if i+my_row < 7 && i+my_col < 7 # down right
                diagonal1 << [i+my_row+1,i+my_col+1]
            end

            if my_row-i-1 >= 0 && my_col-i-1 >= 0 # up left
                diagonal2 << [my_row-i-1,my_col-i-1]
            end

            if my_row-i-1 >= 0 && i+my_col < 7 # up right
                diagonal3 << [my_row-i-1,i+my_col+1]
            end

            if i+my_row < 7 && my_col-i-1 >= 0   # down left
                diagonal4 << [i+my_row+1, my_col-i-1]
            end
            i += 1
        end

        temparr = [diagonal1,diagonal2,diagonal3,diagonal4]

        temparr.each do |diag_arry|
            diag_arry.each do |pos|
                if @board[pos].class == NullPiece #
                    resarr << pos
                elsif @board[pos].color == @color
                    break
                else
                    resarr << pos
                    break
                end
            end
        end

        resarr
    end
    
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
            if @board[pos].class == NullPiece # pos.class == NullPiece
                resarr << pos
            elsif @board[pos].color == @color
                break
            else
                resarr << pos
                break
            end
        end

        down.each do |pos|
            if @board[pos].class == NullPiece # pos.class == NullPiece
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
            if @board[pos].class == NullPiece # pos.class == NullPiece
                resarr << pos
            elsif @board[pos].color == @color
                break
            else
                resarr << pos
                break
            end
        end

        right.each do |pos|
            if @board[pos].class == NullPiece # pos.class == NullPiece
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

