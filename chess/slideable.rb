require_relative "board"
require_relative "piece"

module Slideable

    def diagonal_dirs
        resarr = []
        diagonal1 = [[0,0],[0,1]]
        diagonal2 = []
        diagonal3 = []
        diagonal4 = []
        my_col,my_row = @pos

        i = 0
        while i < @board.rows.length

            # down right
            if i+my_row < 7 && i+my_col < 7 
                ele = @board.rows[i+my_row+1][i+my_col+1]
                diagonal1 << [i+my_row+1,i+my_col+1]
            end

            # up left
            if -i-my_row-1 < 0 && -i-my_col-1 < 0
                ele = @board.rows[-i-my_row-1][-i-my_col-1]
                diagonal1 << [-i-my_row-1,-i-my_col-1]
            end


                # # up right
                # ele2 = @board.rows[-i-1][i]
                # diagonal2 << ele2

                # # down left
                # ele3 = @board.rows[i][-i-1]
                # diagonal3 << ele3

                # # up left
                # ele4 = @board.rows[-i-1][-i-1]
                # diagonal4 << ele4

            i += 1
        end

        p diagonal1
        p diagonal2
        # p diagonal3
        # p diagonal4


        
        # @board.rows.each_with_index do |row,i|
        #     row.each_with_index do |col, j|
        #         # down right

        #         ele = @board.rows[my_row + i + 1][my_col + i + 1]
        #         diagonal1 << ele unless ele.nil?

        #         # up left
        #         # ele2 = @board.rows[my_row - i - 1][my_col - i - 1]
        #         # diagonal2 << ele2 unless ele2.nil?
        #     end
        # end

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


# [0..starting]

# [starting..-1]




# [:black,:white,:white,nil,nil,:white]

# [[0,1],[0,3],[0,4]]


# possible moves
# 