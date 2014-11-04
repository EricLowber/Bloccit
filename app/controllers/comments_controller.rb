class CommentsController < ApplicationController
  
def create  
   @post =  Post.find(params[:post_id])
   @comment = current_user.comments.build(params_comment)
   @comment.post = @post
   authorize @comment
  
   if @comment.save
     flash[:notice] = "Comment was created"
     redirect_to [@post.topic, @post]
   else 
     flash[:error] = "Comment failed to save"
     redirect_to [@post.topic, @post]
   end
  end

  def destroy
    @topic = Topic.find(params[:post_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize @comment

    if @comment.destroy
      flash[:notice] = "Comment was deleted"
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to [@topic, @post]
end

private

def params_comment
  params.require(:comment).permit(:body)
end
