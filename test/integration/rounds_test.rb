require "test_helper"

class RoundsTest < ActionDispatch::IntegrationTest
  test 'returns rounds' do
    round = Round.create(name: 'Test Round')
    get '/api/v1/rounds'
    rounds = json(response.body)
    names = rounds.map { |round| round[:name] }
    assert_equal 200, response.status
    assert_includes names, round.name
  end

  test 'returns rounds filtered by name' do
    get '/api/v1/rounds?name=NFAA900'
    rounds = json(response.body)
    names = rounds.map { |round| round[:name] }
    assert_equal 200, response.status
    assert_includes names, @round_1.name
    refute_includes names, @round_2.name
  end

  test 'returns rounds filtered by category' do
    get '/api/v1/rounds?category=BHFS'
    rounds = json(response.body)
    catgegories = rounds.map { |round| round[:category] }
    assert_equal 200, response.status
    assert_includes catgegories, @round_2.category
    refute_includes catgegories, @round_1.category
  end

  test 'returns rounds filtered by name and category' do
    get '/api/v1/rounds?name=NFAA810&category=BHFS'
    rounds = json(response.body)
    round_ids = rounds.map { |round| round[:id] }
    assert_equal 200, response.status
    assert_includes round_ids, @round_2.id
    refute_includes round_ids, @round_1.id
  end

  private
  def setup
    DatabaseCleaner.start
    @round_1 = Round.create(name: 'NFAA900', category: 'FS')
    @round_2 = Round.create(name: 'NFAA810', category: 'BHFS')
  end

  def teardown
    DatabaseCleaner.clean
  end
end
