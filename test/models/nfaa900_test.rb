require "test_helper"

class NFAA900Test < ActiveSupport::TestCase

  test 'create_ends' do
    @nfaa900.create_ends
    assert_same 15, @nfaa900.round_ends.select(:id).size
    assert_same 15, @nfaa900.round_ends.where(size: 6).size
    [60, 50, 40].each do |distance|
      assert_same 5, @nfaa900.round_ends.where(distance: distance).select(:distance).size
    end
  end

  private
  def setup
    DatabaseCleaner.start
    @nfaa900 ||= NFAA900.create(name: 'TestRound', age_division: 'adult')
  end

  def teardown
    DatabaseCleaner.clean
  end
end
