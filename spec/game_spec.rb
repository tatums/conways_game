require "spec_helper"
module ConwaysGame

  RSpec.describe Game do
    it "works" do
      game = Game.new
      expect(game).to be_an_instance_of(Game)
    end

    it "defaults to a 3 x 3 board" do
      game = Game.new
      game.board.each do |row|
        expect(row).to be_an_instance_of( Array )
          row.each do |item|
            expect( item).to be_an_instance_of( Cell )
          end
      end
    end

  end

end
