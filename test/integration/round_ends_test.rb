require "test_helper"

class RoundEndsTest < ActionDispatch::IntegrationTest
  test 'returns round_ends' do
    get '/api/v1/ends'
    round_ends = json(response.body)
    ids = round_ends.map { |re| re[:id] }
    assert_equal 200, response.status
    assert_includes ids, @round_end_1.id
  end

  test 'returns round_ends filtered by round_id' do
    get '/api/v1/ends?round_id=1'
    round_ends = json(response.body)
    round_ids = round_ends.map { |re| re[:round_id] }
    assert_equal 200, response.status
    assert_includes round_ids, @round_end_1.round_id
    refute_includes round_ids, @round_end_2.round_id
  end

  test 'returns round_ends filtered by uom' do
    get '/api/v1/ends?uom=yd'
    round_ends = json(response.body)
    uoms = round_ends.map { |re| re[:uom] }
    assert_equal 200, response.status
    assert_includes uoms, @round_end_1.uom
    refute_includes uoms, @round_end_2.uom
  end

  test 'returns round_ends filtered by distance' do
    get '/api/v1/ends?distance=60'
    round_ends = json(response.body)
    distances = round_ends.map { |re| re[:distance] }
    assert_equal 200, response.status
    assert_includes distances, @round_end_1.distance
    refute_includes distances, @round_end_2.distance
  end

  test 'returns round_ends filtered by round_id , distance, and uom' do
    get '/api/v1/ends?round_id=2&distance=50&uom=m'
    round_ends = json(response.body)
    round_end_ids = round_ends.map {|re| re[:id] }
    assert_equal 200, response.status
    assert_includes round_end_ids, @round_end_2.id
    refute_includes round_end_ids, @round_end_1.id
  end

  private
  def setup
    DatabaseCleaner.start
    @round_end_1 ||= RoundEnd.create(shots: %w(0 0 0 0 0 0), distance: 60,
                                   uom: 'yd', round_id: 1)
    @round_end_2 ||= RoundEnd.create(shots: %w(0 0 0 0 0 0), distance: 50,
                                   uom: 'm', round_id: 2)
  end

  def teardown
    DatabaseCleaner.clean
  end
end
