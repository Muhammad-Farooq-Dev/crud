require "test_helper"

class CrudControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get crud_index_url
    assert_response :success
  end
end
