require 'test_helper'

class BeastsControllerTest < ActionDispatch::IntegrationTest

  # test "the truth" do
  #   assert true
  # end

  test "should get create" do
    get beasts_create_url
    assert_response :success
  end

  test "should get new" do
    get beasts_new_url
    assert_response :success
  end

end
