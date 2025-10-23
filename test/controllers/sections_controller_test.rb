require "test_helper"

class SectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    post createsession_url, params: { email: @user.email, password: 'password' }
    @workspace = workspaces(:one)
    get switch_to_workspace_url(@workspace)
    @section = sections(:one)
  end

  test "should get index" do
    get page_sections_url(@section.page)
    assert_response :success
  end

  test "should get new" do
    get new_page_section_url(@section.page)
    assert_response :success
  end

  test "should create section" do
    assert_difference("Section.count") do
      post page_sections_url(@section.page), params: { section: { kind: @section.kind, title: @section.title, body: @section.body } }
    end

    assert_redirected_to page_url(@section.page)
  end

  test "should show section" do
    get page_section_url(@section.page, @section)
    assert_response :success
  end

  test "should get edit" do
    get edit_page_section_url(@section.page, @section)
    assert_response :success
  end

  test "should update section" do
    patch page_section_url(@section.page, @section), params: { section: { kind: @section.kind, title: @section.title, body: @section.body } }
    assert_redirected_to page_url(@section.page)
  end

  test "should destroy section" do
    assert_difference("Section.count", -1) do
      delete page_section_url(@section.page, @section)
    end

    assert_redirected_to page_url(@section.page)
  end
end
