require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit "/"

    assert_selector "h4", text: "Search your Flat"
  end
end
