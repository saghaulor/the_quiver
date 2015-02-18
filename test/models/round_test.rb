require 'test_helper'

class RoundTest < ActiveSupport::TestCase
  def setup
    initialize_round_and_ends
  end
  
  test "score" do
    assert_same @round.score, 20
  end

  private
    def initialize_round_and_ends
      @round = Round.create(name: 'Test Round')
      RoundEnd.create(round: @round, shots: [0,0,0,0,0,'x'])
      RoundEnd.create(round: @round, shots: [0,0,0,0,0,'x'])
    end
end
