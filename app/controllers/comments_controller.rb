class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  
  def create
    @game = Game.find(params[:game_id])
    @comment = current_user.comments.build(comment_params)
    @comment = @game.comments.create(comment_params)
    @comment.game_id = @game.id
    if @comment.save
      redirect_to games_path(@game), notice: "Comment saved"
    else
      render '/games'
    end
  end
    private
  def comment_params
    params.require(:comment).permit(:content)
    end
end
