class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]
  
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
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "계정이 성공적으로 수정되었습니다!"
      redirect_to articles_path
    else
      render 'edit'
    end
  end
  
  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 10)
  end
  
  def index
    @user = User.paginate(page: params[:page], per_page: 10)
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def require_same_user
    if current_user != @user
      flash[:danger] = "자신이 쓴 글만 수정할 수 있습니다"
      redirect_to root_path
    end
  end
end