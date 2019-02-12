class ApplicationController < ActionController::Base

  def mechanic?
    !!session[:mechanic_id]
  end

end
