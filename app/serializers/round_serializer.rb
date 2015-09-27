class RoundSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :category, :age_division
end
