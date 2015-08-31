require "test_helper"

class NFAA900EndTest < ActiveSupport::TestCase

  test 'class_end_size' do
    assert_same 6, NFAA900End.end_size
  end

  private
  def nfaa900_end
    @nfaa900_end ||= NFAA900End.new
  end

end
