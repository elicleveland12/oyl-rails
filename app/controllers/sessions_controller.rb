class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :user_authorized, only: [:new, :create, :destroy]
  skip_before_action :mechanic_authorized, only: [:new, :create, :destroy]
  skip_before_action :unauth

  def new
  end

  def create
   if params[:session][:user_type] == "mechanic"
     if Mechanic.find_by(username: params[:session][:username]) != nil
       if params[:session][:password] == Mechanic.find_by(username: params[:session][:username]).password
       session[:mechanic_id] = Mechanic.find_by(username: params[:session][:username]).id
       redirect_to mechanic_path(session[:mechanic_id])
      else
       flash[:message] = "Incorrect username or password."
       redirect_to '/'
     end
    else
     flash[:no_user] = "Incorrect Username Or Password"
     redirect_to '/'
   end
  elsif params[:session][:user_type] == "user"
    if User.find_by(username: params[:session][:username]) != nil
      if params[:session][:password] == User.find_by(username: params[:session][:username]).password
        session[:user_id] = User.find_by(username: params[:session][:username]).id
        redirect_to user_path(session[:user_id])
      else
        flash[:message] = "Incorrect username or password."
        redirect_to '/'
      end
    else
      flash[:no_user] = "Incorrect username or password."
      redirect_to '/'
    end
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
