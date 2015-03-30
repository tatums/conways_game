module ConwaysGame
  class Cell
    attr_reader :x, :y
    attr_accessor :count, :alive, :next_state

    def initialize(x=0, y=0)
      @x, @y = x, y
      self.alive = rand(20) > rand(70)
    end

    def to_s
      if alive
        "•"
      else
        " "
      end
    end

    def transition_to_next_state!
      self.alive = self.next_state
    end

    def next!
      if (alive and count < 2) || (alive and count > 3)
        self.next_state = false
      elsif (alive and (2..3).include?(count) ) || ( !alive and count == 3 )
        self.next_state = true
      end
    end

    # TODO - refactor
    def neighbors(board, y_max, x_max)
      array = []
      array << top          = board[y-1][x]   unless y-1 < 0
      array << bottom       = board[y+1][x]   unless y+1 > y_max
      array << right        = board[y][x+1]   unless x+1 > x_max
      array << left         = board[y][x-1]   unless x-1 < 0
      array << top_left     = board[y+1][x-1] unless y+1 > y_max
      array << top_right    = board[y+1][x+1] unless y+1 > y_max
      array << bottom_left  = board[y-1][x-1] unless y-1 < 0
      array << bottom_right = board[y-1][x+1] unless y-1 < 0
      array.compact
    end

  end
end
