class CommentsController < ApplicationController
  before_action :load_post
  def create
    @comment = @post.comments.build(comment_params)
    if @comment.save
      respond_to do |format|
      format.html {
        flash[:success] = "Thanks for your comment."
        redirect_to @post}
      format.js
      end
    else
      respond_to do |format|
      format.html {flash[:danger] = "Unable to post the comment"}
      format.js { render 'fail_create.js.erb'}
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html {
      redirect_to @post
    }
      format.js
    end
  end

  private
  def load_post
    @post = Post.find(params[:post_id])
  end
  def comment_params
    params.require(:comment).permit(:text)
  end
end
