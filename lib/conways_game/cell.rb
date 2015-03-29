module ConwaysGame
  class Cell
    attr_reader :x, :y
    attr_accessor :count, :alive

    def initialize(x, y)
      @x, @y = x, y
      self.alive = rand(12) > rand(70)
    end

    def to_s
      if alive
        "•"
      else
        " "
      end
    end

    def next!
      if (alive and count < 2) || (alive and count > 3)
        self.alive = false
      elsif (alive and (2..3).include?(count) ) || ( !alive and count == 3 )
        self.alive = true
      end
    end


  end
end
