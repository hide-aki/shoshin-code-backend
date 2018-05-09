require 'test_helper'

class EditsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get edits_create_url
    assert_response :success
  end

end
