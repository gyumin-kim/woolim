class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "울림: 회원가입이 완료되었습니다!"
      redirect_to articles_path
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "계정이 성공적으로 수정되었습니다!"
      redirect_to articles_path
    else
      render 'edit'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end