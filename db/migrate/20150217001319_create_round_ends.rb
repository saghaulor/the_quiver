class CreateRoundEnds < ActiveRecord::Migration
  def change
    create_table :round_ends do |t|
      t.belongs_to :round, index: true
      t.integer :distance
      t.belongs_to :uom, index: true, default: 1
      t.string :shots, array: true, default: []
      t.integer :score
      t.boolean :mulligan, default: false
      t.integer :x_count

      t.timestamps null: false
    end
  end
end
