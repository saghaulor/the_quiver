require 'test_helper'

class RoundEndTest < ActiveSupport::TestCase
  test "round_end_is_invalid_when_distance_is_not_present" do
    round_end = RoundEnd.new(shots: [0,0,0,0,0,'x'], max_shots_count: 6)
    refute round_end.valid?, "Missing presence validation for :distance"
  end

  test "round_end_is_invalid_when_shots_are_greater_than_max_shots_count" do
    round_end = RoundEnd.new(shots: [0,0,0,0,0,'x'], distance: 60, max_shots_count: 5)
    refute round_end.valid?, "Missing size comparison validation for :shots"
    assert round_end.errors.include?(:shots), "Missing size comparison validation for :shots"
  end

  test "round_end_is_invalid_when_max_shots_count_is_not_present" do
    round_end = RoundEnd.new(shots: [0,0,0,0,0,'x'], distance: 60)
    round_end.valid?
    assert round_end.errors.include?(:max_shots_count), "Missing presence validation for :max_shots_count"
  end

  test "calculate_end_score" do
    assert_same round_end.calculate_end_score, 10
  end

  test "calculate_end_score_with_x_eql_5" do
    assert_same round_end.calculate_end_score(5), 5
  end

  test "calculate_x_count" do
    assert_same round_end.calculate_x_count, 1
  end

  test "set_end_score" do
    round_end.valid?
    assert_same round_end.score, 10
  end

  test "set_end_x_count" do
    round_end.valid?
    assert_same round_end.x_count, 1
  end

  test "end_average" do
    round_end.valid?
    assert_in_delta round_end.end_average, (10.to_f / round_end.shots.size), 0.01
  end

  private
  def round_end
    @round_end ||= RoundEnd.new(shots: [0,0,0,0,0,'x'], distance: 60, max_shots_count: 6)
  end
end
