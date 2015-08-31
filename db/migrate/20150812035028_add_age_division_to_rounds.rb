class AddAgeDivisionToRounds < ActiveRecord::Migration
  def up
    create_enum :age_division, 'adult', 'young_adult', 'youth', 'cub', 'senior', 'silver_senior', 'master_senior'
    add_column :rounds, :age_division, :age_division, default: 'adult', after: :category, index: true
  end

  def down
    remove_column :rounds, :age_division
    drop_enum :age_division
  end
end
