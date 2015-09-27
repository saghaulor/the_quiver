require "test_helper"

class RoundEndsTest < ActionDispatch::IntegrationTest
  test 'returns round_ends' do
    get '/api/v1/ends', nil, request_headers
    round_ends = json(response.body)
    ids = round_ends.map { |re| re[:id] }
    assert_equal 200, response.status
    assert_includes ids, round_end_1.id
  end

  test 'returns round_ends filtered by round_id' do
    request_params = { round_id: round_end_1.round_id }
    get "/api/v1/ends", request_params, request_headers
    round_ends = json(response.body)
    round_ids = round_ends.map { |re| re[:round_id] }
    assert_equal 200, response.status
    assert_includes round_ids, round_end_1.round_id
    refute_includes round_ids, round_end_2.round_id
  end

  test 'returns round_ends filtered by uom' do
    request_params = { uom: round_end_1.uom }
    get "/api/v1/ends", request_params, request_headers
    round_ends = json(response.body)
    uoms = round_ends.map { |re| re[:uom] }
    assert_equal 200, response.status
    assert_includes uoms, round_end_1.uom
    refute_includes uoms, round_end_2.uom
  end

  test 'returns round_ends filtered by distance' do
    request_params = { distance: round_end_1.distance }
    get "/api/v1/ends", request_params, request_headers
    round_ends = json(response.body)
    distances = round_ends.map { |re| re[:distance] }
    assert_equal 200, response.status
    assert_includes distances, round_end_1.distance
    refute_includes distances, round_end_2.distance
  end

  test 'returns round_ends filtered by round_id , distance, and uom' do
    request_params = {
                      round_id: round_end_2.round_id,
                      distance: round_end_2.distance,
                      uom: round_end_2.uom
                     }
    get "/api/v1/ends", request_params, request_headers
    round_ends = json(response.body)
    round_end_ids = round_ends.map {|re| re[:id] }
    assert_equal 200, response.status
    assert_includes round_end_ids, round_end_2.id
    refute_includes round_end_ids, round_end_1.id
  end

  private
  def round_end_1
    @round_end_1 ||= round_ends(:nfaa900_round_end_001)
  end

  def round_end_2
    @round_end_2 ||= round_ends(:custom_round_end_001)
  end
end
