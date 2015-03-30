module ConwaysGame
  class Game
    attr_reader :rows, :columns

    def initialize(rows = 40, columns = 80, steps=300)
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
        calculate_next_state!
        transition_to_next_state!
        puts self
      end
    end

    def to_s
      board.map do |row|
        row.map { |col| col.to_s }.join(" ")
      end.join("\n")
    end

    private

      def calculate_next_state!
        board.each_with_index do |row|
          row.each_with_index do |cell|
            cell.count = cell.neighbors(board, y_max, x_max).select{ |i| i.alive }.count
            cell.next!
          end
        end
      end

      def transition_to_next_state!
        board.each_with_index do |row|
          row.each_with_index do |cell|
            cell.transition_to_next_state!
          end
        end
      end

      def y_max
        @rows - 1
      end

      def x_max
        @columns -1
      end

  end
end

