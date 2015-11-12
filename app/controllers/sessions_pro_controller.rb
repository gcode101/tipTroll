class SessionsProController < ApplicationController
  def new
  end

   def create_professional
    professional = Professional.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if professional && professional.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:professional_id] = professional.id
      redirect_to professional_path(professional), notice: "Welcome, you're logged in as #{professional.name}"
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to pro_login_path, notice: "Invalid Username or Password"
    end
  end

  def destroy_professional
    session[:professional_id] = nil
    redirect_to pro_login_path
  end

end
