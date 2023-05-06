require "application_system_test_case"

class MachineriesTest < ApplicationSystemTestCase
  setup do
    @machinery = machineries(:one)
  end

  test "visiting the index" do
    visit machineries_url
    assert_selector "h1", text: "Machineries"
  end

  test "should create machinery" do
    visit machineries_url
    click_on "New machinery"

    fill_in "Characteristics", with: @machinery.characteristics
    fill_in "Code", with: @machinery.code
    fill_in "Cost iva", with: @machinery.cost_iva
    fill_in "Enterprise", with: @machinery.enterprise_id
    fill_in "Freight", with: @machinery.freight
    fill_in "Init date", with: @machinery.init_date
    fill_in "Note", with: @machinery.note
    fill_in "Number", with: @machinery.number
    fill_in "Provider", with: @machinery.provider_id
    fill_in "Renovation date", with: @machinery.renovation_date
    fill_in "Type", with: @machinery.type
    click_on "Create Machinery"

    assert_text "Machinery was successfully created"
    click_on "Back"
  end

  test "should update Machinery" do
    visit machinery_url(@machinery)
    click_on "Edit this machinery", match: :first

    fill_in "Characteristics", with: @machinery.characteristics
    fill_in "Code", with: @machinery.code
    fill_in "Cost iva", with: @machinery.cost_iva
    fill_in "Enterprise", with: @machinery.enterprise_id
    fill_in "Freight", with: @machinery.freight
    fill_in "Init date", with: @machinery.init_date
    fill_in "Note", with: @machinery.note
    fill_in "Number", with: @machinery.number
    fill_in "Provider", with: @machinery.provider_id
    fill_in "Renovation date", with: @machinery.renovation_date
    fill_in "Type", with: @machinery.type
    click_on "Update Machinery"

    assert_text "Machinery was successfully updated"
    click_on "Back"
  end

  test "should destroy Machinery" do
    visit machinery_url(@machinery)
    click_on "Destroy this machinery", match: :first

    assert_text "Machinery was successfully destroyed"
  end
end
