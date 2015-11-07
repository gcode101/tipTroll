class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_customer
    @current_customer ||= Customer.find(session[:customer_id]) if session[:customer_id]
  end
  helper_method :current_customer

  def current_professional
    @current_professional ||= Professional.find(session[:professional_id]) if session[:professional_id]
  end
  helper_method :current_professional


  def authorize_customer
    redirect_to '/login' unless current_customer
  end

   def authorize_professional
    redirect_to '/login' unless current_professional
  end

  def is_this_me?(customer)
    current_customer && current_customer.id == customer.id
  end

  def is_this_pro?(professional)
    current_professional && current_professional.id == professional.id
  end

  helper_method :is_this_pro?
  helper_method :is_this_me?


end
