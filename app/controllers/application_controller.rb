class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user  # current_user를 갖고 있으면 true를 return함
  end
  
  def require_user  # 로그인되어 있지 않을 때의 제한사항
    if !logged_in?
      flash[:danger] = "로그인이 필요합니다"
      redirect_to root_path
    end
  end
end
