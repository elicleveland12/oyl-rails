class ApplicationController < ActionController::Base
before_action :user_authorized
before_action :mechanic_authorized
before_action :unauth
helper_method :current_user
helper_method :current_mechanic



  def current_user
    User.find_by({ id: session[:user_id] })
  end

  def current_mechanic
    Mechanic.find_by({ id: session[:mechanic_id] })
  end

  def user_logged_in?
    !!session[:user_id]
  end

  def mechanic_logged_in?
    !!session[:mechanic_id]
  end

  def user_authorized
    redirect_to '/' unless user_logged_in?
  end

  def mechanic_authorized
    redirect_to '/' unless mechanic_logged_in?
  end

  def unauth
    if mechanic_logged_in?
    elsif
      user_logged_in?
    else
      redirect_to '/'
    end
  end


end
