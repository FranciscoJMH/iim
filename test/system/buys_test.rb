require "application_system_test_case"

class BuysTest < ApplicationSystemTestCase
  setup do
    @buy = buys(:one)
  end

  test "visiting the index" do
    visit buys_url
    assert_selector "h1", text: "Buys"
  end

  test "should create buy" do
    visit buys_url
    click_on "New buy"

    fill_in "Iva", with: @buy.iva
    fill_in "Project", with: @buy.project_id
    fill_in "Quantity", with: @buy.quantity
    fill_in "Total", with: @buy.total
    click_on "Create Buy"

    assert_text "Buy was successfully created"
    click_on "Back"
  end

  test "should update Buy" do
    visit buy_url(@buy)
    click_on "Edit this buy", match: :first

    fill_in "Iva", with: @buy.iva
    fill_in "Project", with: @buy.project_id
    fill_in "Quantity", with: @buy.quantity
    fill_in "Total", with: @buy.total
    click_on "Update Buy"

    assert_text "Buy was successfully updated"
    click_on "Back"
  end

  test "should destroy Buy" do
    visit buy_url(@buy)
    click_on "Destroy this buy", match: :first

    assert_text "Buy was successfully destroyed"
  end
end
