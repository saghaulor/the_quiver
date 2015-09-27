class AddGenderToUsers < ActiveRecord::Migration
  def up
    create_enum :gender, 'male', 'female'
    add_column :users, :gender, :gender, default: 'male', after: :first_name, index: true
  end
end
