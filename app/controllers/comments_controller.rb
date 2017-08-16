class CommentsController < ApplicationController
  before_action :find_article
  before_action :find_comment, only: [:destroy, :edit, :update, :comment_owner]
  before_action :comment_owner, only: [:destroy, :edit, :update]
  def create
    if session[:user_id] != nil
      @comment = @article.comments.create(params[:comment].permit(:content))
      @comment.user_id = current_user.id
      @comment.save
      redirect_to article_path(@article)
    else
      flash[:danger] = "로그인 후 이용해 주세요!"
      redirect_to article_path(@article)
    end
  end
  
  def destroy
    @comment.destroy
    redirect_to article_path(@article)
  end
  
  def edit
    
  end
  
  def update
    if @comment.update(params[:comment].permit(:content))
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  private
  def find_article
    @article = Article.find(params[:article_id])
  end
  
  def find_comment
    @comment = @article.comments.find(params[:id])
  end
  
  def comment_owner
    unless current_user.id == @comment.user_id
      flash[:notice] = "허용되지 않는 접근 방식입니다!"
      redirect_to @article
    end
  end
end
