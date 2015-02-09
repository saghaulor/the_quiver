class CreateGroupEnds < ActiveRecord::Migration
  def change
    create_table :archery_ends do |t|
      t.belongs_to :shoot, index: true
      t.string :type
      t.integer :distance
      t.integer :uom
      t.string :shots, array: true, default: []
      t.integer :score
      t.boolean :mulligan, default: false
      t.integer :x_count

      t.timestamps null: false
    end
  end
end
