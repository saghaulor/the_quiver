require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Test relations
  should have_many :rounds

  # Test attributes
  should have_db_column :last_name

  should have_db_column :first_name

  should have_db_column :email

  should have_db_column :password_digest

  should have_db_column :gender

  should define_enum_for :gender

  # Test validations
  should validate_uniqueness_of :email

  should validate_presence_of :email

  should_not allow_value('derp').for :email

  should allow_value('derp@derp.com').for :email

  should have_secure_password

  should validate_length_of(:password).is_at_least(16)
end
