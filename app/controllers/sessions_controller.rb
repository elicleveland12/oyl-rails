class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :user_authorized, only: [:new, :create, :destroy]
  skip_before_action :mechanic_authorized, only: [:new, :create, :destroy]


  def new
  end

  def create

   if params[:session][:user_type] == "mechanic"
     session[:mechanic_id] = Mechanic.find_by(username: params[:session][:username]).id
     redirect_to mechanic_path(session[:mechanic_id])

   else

      # logged_in_person = User.find_by_name(params[username]).id || Mechani
      # if logged_in_person.class == User

      session[:user_id] = User.find_by(username: params[:session][:username]).id
      # else
      # logged_in_person session[:mechanic_id]
      # session[:mechanic_id] = params[:mechanic_id]

      redirect_to user_path(session[:user_id])
    end
  end

  def destroy

  session[:user_id] = nil
  session[:mechanic_id] = nil
  redirect_to '/'
  end

  def mechanic?(user_type)
    return user_type
  end

  private

  def session_params
    params.require(:session).permit(:username, :password, :user_type)
  end


end
