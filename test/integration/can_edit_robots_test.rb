require "test_helper"

class CanEditRobotsTest < ActionDispatch::IntegrationTest
  test "Can edit robots" do
    Robot.create(name: "Frank")
    Robot.create(name: "Jones").abilities.create(name: "Kung fu")
    Robot.create(name: "Bob")

    visit root_path
    click_on "Edit Jones"
    fill_in "Name", with: "Jill"
    fill_in "Abilities", with: "Chopping"
    click_on "Update Robot"

    assert_current_path root_path
    click_on "Jill"
    assert page.has_content? "Chopping"
    refute page.has_content? "Kung fu"
  end
end
