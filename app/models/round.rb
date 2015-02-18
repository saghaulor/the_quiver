class Round < ActiveRecord::Base
  has_many :round_ends
  belongs_to :user

  def score
    self.round_ends.inject(0) { |sum, re| sum += re.score }
  end
end
