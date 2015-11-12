require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  # test "the false" do
  #   assert false
  # end

  test "customer email never nil" do
    c = Customer.new
    c.email = nil
    assert_not c.save, "Customer emails should never be nil"
  end


end
