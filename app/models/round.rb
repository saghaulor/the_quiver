class Round < ActiveRecord::Base
  has_many :round_ends, dependent: :destroy
  belongs_to :user

  validates :name, presence: true

  enum age_division: { cub: 'cub',
                       youth: 'youth',
                       young_adult: 'young_adult',
                       adult: 'adult',
                       senior: 'senior',
                       silver_senior: 'silver_senior',
                       master_senior: 'master_senior' }

  def score
    round_ends.inject(0) { |sum, re| sum += re.score }
  end

  def x_count
    round_ends.inject(0) { |sum, re| sum += re.x_count }
  end

  def average
    if round_ends.empty?
      nil.to_f
    else
      sum = round_ends.inject(0) { |sum, re| sum += re.end_average }
      sum.to_f / end_count
    end
  end

  def end_count
    round_ends.count
  end

  def can_mulligan?
    false
  end

  def create_ends
    nil
  end
end
