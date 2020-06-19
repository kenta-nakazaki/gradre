class DreamsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def index
    if logged_in?
      @dreams = current_user.feed_dreams.order(id: :desc).page(params[:page])
    end 
  end 
  
  def new
    if logged_in?
      @dream = current_user.dreams.build
    end 
  end

  def show
    @dream = Dream.find(params[:id])
    @comments = @dream.comments.order(id: :desc).page(params[:page])
    @comment = Comment.new
  end 
  
  def create
    @dream = current_user.dreams.build(dream_params)
    if @dream.save
      flash[:success] = '投稿完了しました。'
      redirect_to dreams_url
    else
      @dreams = current_user.feed_dreams.order(id: :desc).page(params[:page])
      flash.now[:danger] = '投稿に失敗しました。'
      render 'dreams/new'
    end
  end 
  
  def destroy
    @dream.destroy
    flash[:success] = '投稿を削除しました。'
    redirect_back(fallback_location: dreams_path)
  end
  
  private
  
  def dream_params
    params.require(:dream).permit(:content, :deadline, :status, :priority, :category)
  end 
  
  def correct_user
    @dream = current_user.dreams.find_by(id: params[:id])
    unless @dream
      redirect_to dreams_url
    end
  end
  
  
end
