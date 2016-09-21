require 'test_helper'

class CustomerHistoriesControllerTest < ActionController::TestCase
  setup do
    @customer_history = customer_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customer_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer_history" do
    assert_difference('CustomerHistory.count') do
      post :create, customer_history: { date_create: @customer_history.date_create, problem: @customer_history.problem, remark: @customer_history.remark, solution: @customer_history.solution }
    end

    assert_redirected_to customer_history_path(assigns(:customer_history))
  end

  test "should show customer_history" do
    get :show, id: @customer_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer_history
    assert_response :success
  end

  test "should update customer_history" do
    patch :update, id: @customer_history, customer_history: { date_create: @customer_history.date_create, problem: @customer_history.problem, remark: @customer_history.remark, solution: @customer_history.solution }
    assert_redirected_to customer_history_path(assigns(:customer_history))
  end

  test "should destroy customer_history" do
    assert_difference('CustomerHistory.count', -1) do
      delete :destroy, id: @customer_history
    end

    assert_redirected_to customer_histories_path
  end
end
