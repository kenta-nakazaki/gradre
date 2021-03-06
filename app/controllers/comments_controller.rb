class CommentsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @dream = Dream.find(params[:dream_id])
    @comment.dream_id = @dream.id
    if @comment.save
      flash[:success] = "コメント完了しました。"
      redirect_to @dream
    else
      @dreams = current_user.feed_dreams.order(id: :desc).page(params[:page])
      flash[:danger] = "コメントに失敗しました。"
      redirect_back(fallback_location: dreams_path)
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = '投稿を削除しました。'
    redirect_back(fallback_location: @dream)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end 
end
