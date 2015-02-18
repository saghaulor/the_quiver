require 'test_helper'

class RoundEndTest < ActiveSupport::TestCase
  def setup
    initialize_end
  end

  test "calculate_end_score" do
    assert_same @end.calculate_end_score, 10
  end

  test "end_x_count" do
    assert_same @end.end_x_count, 1
  end

  test "set_end_score" do
    assert_same @end.score, 10
  end

  test "set_end_x_count" do
    assert_same @end.x_count, 1
  end

  private
    def initialize_end
      @end = RoundEnd.new(shots: [0,0,0,0,0,'x'])
      @end.valid?
    end
end
