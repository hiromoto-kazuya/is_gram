class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def check_user_login_status
    @current_user = User.find_by(id: session[:user_id])
    if @current_user == nil
      flash[:notice] = "ログインしてください"
      redirect_to new_session_path
    end
  end
end
