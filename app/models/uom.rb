class Uom < ActiveRecord::Base
  has_many :round_ends

  def to_s
    unit
  end
end
