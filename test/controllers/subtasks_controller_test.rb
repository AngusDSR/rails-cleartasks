require "test_helper"

class SubtasksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get subtasks_new_url
    assert_response :success
  end

  test "should get destroy" do
    get subtasks_destroy_url
    assert_response :success
  end
end
