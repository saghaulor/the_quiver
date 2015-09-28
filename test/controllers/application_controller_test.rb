require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  should use_before_action :authenticate
end
