class CommentsController < ApplicationController

  def create
    @comment = Comment.create(get_param)
    #  @comment = Comment.new(get_param)
    if @comment.created_at
      redirect_to prototype_path(@comment.prototype) 
     else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      @user = User.find(@prototype.user_id)
      render "prototypes/show"
    end  
  end


 private
  def get_param 
   params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end