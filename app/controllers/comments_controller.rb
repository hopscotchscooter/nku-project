class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  
  def create
    @game = Game.find(params[:game_id])
 
    @comment = @game.comments.build(comment_params)
    @comment = current_user.comments.build(comment_params)
    @comment.author = current_user.username
    @comment.game_id = @game.id
    @comment.user_id = current_user
    if @comment.save
      redirect_to game_path(@game), notice: "Comment saved"
    else
      render '/games'
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to games_path, notice: "Comment deleted"
  end
  
  def vote
    vote = current_user.comment_votes.new(score: params[:score], comment_id: params[:id])
    if vote.save
      redirect_to games_path, notice: "Vote tallied"
    else
      redirect_to games_path, alert: "Unable to vote"
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content)
    end
end
