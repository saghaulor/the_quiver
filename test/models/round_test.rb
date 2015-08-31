require 'test_helper'

class RoundTest < ActiveSupport::TestCase
  test "score" do
    assert_same @round.score, 20
  end

  test "x_count" do
    assert_same @round.x_count, 2
  end

  test "average" do
    shots = @round.round_ends.inject(0) {|sum, round| sum += round.size}
    assert_in_delta @round.average, (20.to_f / shots), 0.01
  end

  test "average_without_ends" do
    assert_same Round.new.average, 0.0
  end

  test "create_ends" do
    assert_nil Round.new.create_ends
  end

  test "determine_age_division" do
    skip
    # user = user.new
    # user.stub(dob: date.today - 19.years) do
    #   round = round.new(user: user)
    #   assert_equal round.age_division, 'adult'
    # end

  end

  private
  def setup
    DatabaseCleaner.start
    @round = Round.create(name: 'Test Round')
    attrs = { round: @round, shots: [0,0,0,0,0,'x'], distance: 50, uom: 'yd' }
    RoundEnd.create(attrs)
    RoundEnd.create(attrs)
  end

  def teardown
    DatabaseCleaner.clean
  end
end
