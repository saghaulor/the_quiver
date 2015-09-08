class RoundEnd < ActiveRecord::Base
  include ActiveModel::Validations

  belongs_to :round

  validates :shots, max_shots_count: true
  validates :distance, presence: true
  validates :max_shots_count, presence: true

  after_validation :set_end_score, :set_end_x_count

  enum uom: { yd: 'yd',
              m: 'm',
              ft: 'ft' }

  def end_average
    (score.to_f / max_shots_count).round(2)
  end

  def calculate_x_count
    shots.inject(0) do |sum, shot|
      sum += shot.downcase.eql?("x") ? 1 : 0
    end
  end

  def calculate_end_score(x_val = 10)
    x_val = x_val.to_i
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
