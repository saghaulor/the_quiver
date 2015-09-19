require 'test_helper'

class RoundEndTest < ActiveSupport::TestCase
  # Test relations
  should belong_to :round

  # Test attributes
  should have_db_column :round_id

  should have_db_column :distance

  should have_db_column :uom

  should have_db_column :max_shots_count

  should have_db_column :shots

  should have_db_column :mulligan

  should have_db_column :score

  should have_db_column :x_count

  should define_enum_for :uom

  # Test validations
  should validate_presence_of :distance

  should validate_presence_of :max_shots_count

  test "round_end_is_invalid_when_shots_are_greater_than_max_shots_count" do
    round_end = RoundEnd.new(shots: [0,0,0,0,0,'x'], distance: 60, max_shots_count: 5)
    refute round_end.valid?, "Missing size comparison validation for :shots"
    assert round_end.errors.include?(:shots), "Missing size comparison validation for :shots"
  end

  # Test methods
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
