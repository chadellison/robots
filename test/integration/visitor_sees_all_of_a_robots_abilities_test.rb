require "test_helper"

class VisitorSeesAllOfARobotsAbilitiesTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "visitor sees all of a robots abilities" do
    robot1 = Robot.create(name: "Frank")
    robot2 = Robot.create(name: "Martha")
    robot3 = Robot.create(name: "Rosco")
    robot4 = Robot.create(name: "Jones")

    robot3.abilities.create(name: "vacuuming")

    visit root_path
    assert page.has_content? "Frank Martha Rosco Jones"

    click_on "Rosco"
    assert page.has_content? "Abilities: vacuuming"
  end
end
