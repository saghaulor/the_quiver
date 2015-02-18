class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.string :category

      t.timestamps null: false
    end
  end
end
