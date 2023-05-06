require "test_helper"

class MachineriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @machinery = machineries(:one)
  end

  test "should get index" do
    get machineries_url
    assert_response :success
  end

  test "should get new" do
    get new_machinery_url
    assert_response :success
  end

  test "should create machinery" do
    assert_difference("Machinery.count") do
      post machineries_url, params: { machinery: { characteristics: @machinery.characteristics, code: @machinery.code, cost_iva: @machinery.cost_iva, enterprise_id: @machinery.enterprise_id, freight: @machinery.freight, init_date: @machinery.init_date, note: @machinery.note, number: @machinery.number, provider_id: @machinery.provider_id, renovation_date: @machinery.renovation_date, type: @machinery.type } }
    end

    assert_redirected_to machinery_url(Machinery.last)
  end

  test "should show machinery" do
    get machinery_url(@machinery)
    assert_response :success
  end

  test "should get edit" do
    get edit_machinery_url(@machinery)
    assert_response :success
  end

  test "should update machinery" do
    patch machinery_url(@machinery), params: { machinery: { characteristics: @machinery.characteristics, code: @machinery.code, cost_iva: @machinery.cost_iva, enterprise_id: @machinery.enterprise_id, freight: @machinery.freight, init_date: @machinery.init_date, note: @machinery.note, number: @machinery.number, provider_id: @machinery.provider_id, renovation_date: @machinery.renovation_date, type: @machinery.type } }
    assert_redirected_to machinery_url(@machinery)
  end

  test "should destroy machinery" do
    assert_difference("Machinery.count", -1) do
      delete machinery_url(@machinery)
    end

    assert_redirected_to machineries_url
  end
end
