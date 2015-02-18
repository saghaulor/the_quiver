class CreateUoms < ActiveRecord::Migration
  def change
    create_table :uoms do |t|
      t.string :unit

      t.timestamps null: false
    end
  end
end
