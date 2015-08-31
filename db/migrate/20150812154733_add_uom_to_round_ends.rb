class AddUomToRoundEnds < ActiveRecord::Migration
  def up
    create_enum :uom, 'yd', 'm', 'ft'
    add_column :round_ends, :uom, :uom, default: 'yd', after: :distance, index: true
  end

  def down
    remove_column :round_ends, :uom
    drop_enum :uom
  end
end
