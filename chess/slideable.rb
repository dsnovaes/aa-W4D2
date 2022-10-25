module Slideable
    def horizontal_dirs
        resarr = []
        left = []
        right = []
        my_row,my_col = @pos
        # horizontal
        @board.rows[my_row].each_with_index do |pos,i|
            if i < my_col 
                left << [my_row,i]
            elsif i > my_col
                right << [my_row,i]
            end

        end
        resarr + left + right

        # vertical / tranpose


    end
end


# [0..starting]

# [starting..-1]




# [:black,:white,:white,nil,nil,:white]

# [[0,1],[0,3],[0,4]]


# possible moves
# 