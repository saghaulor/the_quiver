class MaxShotsCountValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, "size must be less than or equal to #{record.max_shots_count}" unless record.max_shots_count && (value.size <= record.max_shots_count)
  end
end

