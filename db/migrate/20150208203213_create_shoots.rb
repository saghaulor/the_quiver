class CreateShoots < ActiveRecord::Migration
  def change
    create_table :shoots do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.string :type
      t.string :category

      t.timestamps null: false
    end
  end
end
