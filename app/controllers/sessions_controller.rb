class SessionsController < ApplicationController
  def new
  end

  def create_customer
    customer = Customer.find_by_email(params[:email])
    # If the customer exists AND the password entered is correct.
    if customer && customer.authenticate(params[:password])
      # Save the customer id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:customer_id] = customer.id
      redirect_to customer_path(customer), notice: "Welcome, you're logged in as #{customer.name}"
    else
    # If customer's login doesn't work, send them back to the login form.
      redirect_to login_path, notice: "Invalid Username or Password"
    end
  end

  def destroy_customer
    session[:customer_id] = nil
    redirect_to login_path
  end
end
