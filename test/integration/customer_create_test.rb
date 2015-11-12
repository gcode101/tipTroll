require 'test_helper'

class CustomerCreateTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "index and create customer" do
    # get customers index
    get '/customers'
    assert_response :success

    # get new customer form
    get '/customers/new'
    assert_response :success

    # test create a new customer
    assert_difference('Customer.count') do
      post_via_redirect '/customers', customer: { email: 'integration@wyncode.co', name: 'Integration Test'}
  end

    # test redirect to /customers/something
    assert_match /\/customers\/\d+/, path
    assert_equal 'Customer was successfully created.', flash[:notice]

    # test new customer appears on index page
    get '/customers'
    assert_select 'td', 'integration@wyncode.co', 1
    assert_select 'td', 'Integration Test', 1

  end
end
