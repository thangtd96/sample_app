require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = 'Ruby on Rails Tutorial Sample App'
  end

  test "should get index" do
    #lay ra url
    get root_url
    #tra ve success neu true
    assert_response :success
    # test tieu de cho the title trong trang index
    assert_select "title", "Home | #{@base_title}"
    # test the a trong trang index
    assert_select "a", "BLOGS"
  end

  test "should get help" do
    get help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

end
