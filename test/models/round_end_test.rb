require 'test_helper'

class RoundEndTest < ActiveSupport::TestCase
  test "calculate_end_score" do
    assert_same @end.calculate_end_score, 10
  end

  test "calculate_end_score_with_x_eql_5" do
    assert_same @end.calculate_end_score(5), 5
  end

  test "calculate_x_count" do
    assert_same @end.calculate_x_count, 1
  end

  test "set_end_score" do
    assert_same @end.score, 10
  end

  test "set_end_x_count" do
    assert_same @end.x_count, 1
  end

  test "end_average" do
    assert_in_delta @end.end_average, (10.to_f / @end.shots.size), 0.01
  end

  test "size" do
    assert_same @end.size, @end.class.end_size
  end

  private
  def setup
    DatabaseCleaner.start
    @end = RoundEnd.new(shots: [0,0,0,0,0,'x'])
    @end.valid?
  end

  def teardown
    DatabaseCleaner.clean
  end
end
