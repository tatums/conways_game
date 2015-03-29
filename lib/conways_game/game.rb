module ConwaysGame
  class Game
    ## 150 x 50 is nice
    def initialize(rows = 40, columns = 80, steps=200)
        @rows    = rows
        @columns = columns
        @steps   = steps
    end

    def board
      @board ||= @rows.times.with_index.map do |y|
                    @columns.times.with_index.map do |x|
                      Cell.new(x, y)
                    end
                  end
    end

    def play!
      (1..@steps).each do
        sleep(0.055)
        system("clear")
        next!
        puts self
      end
    end

    def next!
      board.each_with_index do |row|
        row.each_with_index do |cell|
          next_state_for(cell)
        end
      end
    end

    def next_state_for(cell)
      cell.count = neighbor_count_for(cell)
      cell.next!
    end

    def neighbor_count_for(cell)
      array = []
      array << top          = board[cell.y-1][cell.x] unless cell.y-1 < 0
      array << bottom       = board[cell.y+1][cell.x] unless cell.y+1 > @rows-1
      array << right        = board[cell.y][cell.x+1] unless cell.x+1 > @columns-1
      array << left         = board[cell.y][cell.x-1] unless cell.x-1 < 0
      array << top_left     = board[cell.y+1][cell.x-1] unless cell.y+1 > @rows-1
      array << top_right    = board[cell.y+1][cell.x+1] unless cell.y+1 > @rows-1
      array << bottom_left  = board[cell.y-1][cell.x-1] unless cell.y-1 < 0
      array << bottom_right = board[cell.y-1][cell.x+1] unless cell.y-1 < 0
      array.compact.select{ |i| i.alive }.count
    end

    def to_s
      board.map do |row|
        row.map { |col| col.to_s }.join(" ")
      end.join("\n")
    end
  end
end

