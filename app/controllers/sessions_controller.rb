class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "로그인 되었습니다!"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "로그인 정보를 확인해 주세요"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "로그아웃 되었습니다!"
    redirect_to root_path
  end
end