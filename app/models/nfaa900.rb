class NFAA900 < Round
  def create_ends
    end_attributes = []
    [60, 50, 40].each do |distance|
      5.times do
        end_attributes << { distance: distance, max_shots_count: 6, uom: 'yd' }
      end
    end
    round_ends.create(end_attributes)
  end
end
