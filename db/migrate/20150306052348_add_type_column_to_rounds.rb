class AddTypeColumnToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :type, :string, after: :id
  end
end
