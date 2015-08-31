class RoundEnd < ActiveRecord::Base
  belongs_to :round

  before_validation :set_end_score, :set_end_x_count

  def self.end_size
    6
  end

  enum uom: {
    yd: 'yd',
    m: 'm',
    ft: 'ft'
  }

  validates :shots, length: { maximum: end_size } # End size must be defined before the validation can be called.
  validates :distance, :uom, presence: true

  def size
    self.class.end_size
  end

  def end_average
    (score.to_f / self.class.end_size).round(2)
  end

  def calculate_x_count
    shots.inject(0) do |sum, shot|
      sum += shot.downcase.eql?("x") ? 1 : 0
    end
  end

  def calculate_end_score(x_val = 10)
    shots.inject(0) do |sum, shot|
      shot_score = shot.downcase.eql?("x") ? x_val : shot.to_i
      sum += shot_score
    end
  end

  private

  def set_end_score
    self.score= calculate_end_score
  end

  def set_end_x_count
    self.x_count= calculate_x_count
  end
end
