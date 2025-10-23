require "application_system_test_case"

class SectionsTest < ApplicationSystemTestCase
  setup do
    @section = sections(:one)
  end

  test "visiting the index" do
    visit sections_url
    assert_selector "h1", text: "Sections"
  end

  test "should create section" do
    visit sections_url
    click_on "New section"

    fill_in "Kind", with: @section.kind
    fill_in "Page", with: @section.page_id
    fill_in "Position", with: @section.position
    fill_in "Title", with: @section.title
    click_on "Create Section"

    assert_text "Section was successfully created"
    click_on "Back"
  end

  test "should update Section" do
    visit section_url(@section)
    click_on "Edit this section", match: :first

    fill_in "Kind", with: @section.kind
    fill_in "Page", with: @section.page_id
    fill_in "Position", with: @section.position
    fill_in "Title", with: @section.title
    click_on "Update Section"

    assert_text "Section was successfully updated"
    click_on "Back"
  end

  test "should destroy Section" do
    visit section_url(@section)
    click_on "Destroy this section", match: :first

    assert_text "Section was successfully destroyed"
  end
end
