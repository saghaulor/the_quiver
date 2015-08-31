class RoundEndSerializer < ActiveModel::Serializer
  attributes :id, :round_id, :distance, :uom, :shots, :score, :end_average, :x_count, :mulligan, :created_at, :updated_at
end
