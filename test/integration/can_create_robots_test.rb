require "test_helper"

class CanCreateRobotsTest < ActionDispatch::IntegrationTest
  test "user can create robots" do
    visit root_path
    refute page.has_content? "Jones"

    click_on "Create Robot"
    fill_in "Name", with: "Jones"
    fill_in "Abilities", with: "baking"

    click_on "Create Robot"

    assert page.has_content? "Jones"
  end
end
