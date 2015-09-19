class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :last_name
      t.string :first_name
      t.string :email
      t.binary :password_digest, limit: 60

      t.timestamps null: false
    end
  end
end
