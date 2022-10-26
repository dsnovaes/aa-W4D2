require_relative "board"
require "io/console"

class Cursor
    attr_reader :cursor_pos
    attr_accessor :selected


    def initialize(cursor_pos, board)
        @cursor_pos = cursor_pos
        @board = board
        @selected = false
    end

    def toggle_selected

    end

    KEYMAP = {
        " " => :space,
        "\r" => :return,
        "h" => :left,
        "j" => :down,
        "k" => :up,
        "l" => :right,
        "w" => :up,
        "a" => :left,
        "s" => :down,
        "d" => :right,
        "\e[A" => :up,
        "\e[B" => :down,
        "\e[C" => :right,
        "\e[D" => :left,
        "\u0003" => :ctrl_c,
      }

    MOVES = {
        left: [0, -1],
        right: [0, 1],
        up: [-1, 0],
        down: [1, 0]
    }


    def get_input
        key = KEYMAP[read_char]
        handle_key(key)
    end

    def handle_key(key)
        case key
        when :ctrl_c
          exit 0
        when :return, :space
          # this selects the piece to move
          # AND it's end pos
        when :left, :right, :up, :down
          update_pos(MOVES[key])
          nil
        else
          puts key
        end

    end

    def read_char
        STDIN.echo = false
        STDIN.raw!
    
        input = STDIN.getc.chr
        if input == "\e" then
          input << STDIN.read_nonblock(3) rescue nil
          input << STDIN.read_nonblock(2) rescue nil
        end
      ensure
        STDIN.echo = true
        STDIN.cooked!
    
        return input
    end


    def update_pos(diff)
        new_pos = [@cursor_pos[0] + diff[0], @cursor_pos[1] + diff[1]]
        @cursor_pos = new_pos if in_bounds?(new_pos)
    end

    def in_bounds?(pos)
        pos.all? { |x| x.between?(0, 7) }
    end

end