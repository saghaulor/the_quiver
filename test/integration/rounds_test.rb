require "test_helper"

class RoundsTest < ActionDispatch::IntegrationTest
  test 'returns rounds' do
    get '/api/v1/rounds'
    rounds = json(response.body)
    names = rounds.map { |round| round[:name] }
    assert_equal 200, response.status
    assert_includes names, round_1.name
  end

  test 'returns rounds filtered by name' do
    get "/api/v1/rounds?name=#{round_1.name}"
    rounds = json(response.body)
    names = rounds.map { |round| round[:name] }
    assert_equal 200, response.status
    assert_includes names, round_1.name
    refute_includes names, round_2.name
  end

  test 'returns rounds filtered by category' do
    get "/api/v1/rounds?category=#{round_2.category}"
    rounds = json(response.body)
    catgegories = rounds.map { |round| round[:category] }
    assert_equal 200, response.status
    assert_includes catgegories, round_2.category
    refute_includes catgegories, round_1.category
  end

  test 'returns rounds filtered by name and category' do
    get "/api/v1/rounds?name=#{round_2.name}&category=#{round_2.category}"
    rounds = json(response.body)
    round_ids = rounds.map { |round| round[:id] }
    assert_equal 200, response.status
    assert_includes round_ids, round_2.id
    refute_includes round_ids, round_1.id
  end

  test 'returns the rounds' do
    get "/api/v1/rounds/#{round_1.id}"
    round = json(response.body)
    assert_equal 200, response.status
    assert_equal round_1.id, round[:id]
  end

  private
  def round_1
    @round_1 ||= rounds(:nfaa900)
  end

  def round_2
    @round_2 ||= rounds(:nfaa810)
  end
end
