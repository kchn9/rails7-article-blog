require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest

  setup do
    @admin = User.create(username: "LordVader", email: "lordv@darkness.com",
                        password: "password", admin: true)
    sign_in_as(@admin)
  end

  test "get new category form and create category" do
    get "/categories/new"
    assert_response :success
    assert_difference "Category.count", 1 do
      post "/categories", params: { category: { name: "Sports" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Sports", response.body
  end

  test "get new category and reject invalid category input" do
    get "/categories/new"
    assert_no_difference "Category.count" do
      post "/categories", params: { category: { name: " " } }
    end
    assert_select 'div.alert' # error msg show up
    assert_match "errors", response.body
  end

end
