require "spec_helper"

module ConwaysGame
  RSpec.describe Cell do
    subject { Cell.new }
    it "setup the board" do
      expect(subject).to be_instance_of(Cell)
    end

    describe "#friends" do
      context "when at 0,0" do
        skip "does" do
          expect(subject.friends).to eq([[1,0],[1,0],[1,1]])
        end
      end
      context "when at 0,1" do
        it "does" do
          expect(subject.friends).to eq([[0,0],[1,0],[1,1]])
        end
      end
    end

    describe "#alive" do
      context "given an alive cell" do
        context "and 1 neighbor is alive (count=1)" do
          it "is dead" do
            subject.alive = true
            subject.count = 1
            subject.next!
            expect(subject.alive).to eq(false)
          end
        end
        context "and 2 alive neighbors (count=2)" do
          it "is alive" do
            subject.alive = true
            subject.count = 2
            subject.next!
            expect(subject.alive).to eq(true)
          end
        end
        context "and 3 alive neighbors (count=3)" do
          it "is alive" do
            subject.alive = true
            subject.count = 3
            subject.next!
            expect(subject.alive).to eq(true)
          end
        end
        context "given an alive cell and 4 alive neighbors (count=4)" do
          it "after next is called alive is true" do
            subject.alive = true
            subject.count = 4
            subject.next!
            expect(subject.alive).to eq(false)
          end
        end
      end
    end


  end

end
