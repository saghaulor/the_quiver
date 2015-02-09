class ArcheryEnd < ActiveRecord::Base
  before_validation :set_end_score, :set_end_x_count

  def calculate_end_score(x_val = 10)
    shots.inject(0) do |sum, shot|
      shot_score = shot.eql?("x") ? x_val : shot.to_i
      sum += shot_score
    end
  end

  def end_x_count
    shots.inject(0) do |sum, shot|
      sum += shot.eql?("x") ? 1 : 0
    end
  end

  def set_end_score
    self.score= calculate_end_score
  end

  def set_end_x_count
    self.x_count= end_x_count
  end
end
