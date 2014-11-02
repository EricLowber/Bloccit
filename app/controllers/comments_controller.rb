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
end

private

def params_comment
  params.require(:comment).permit(:body)
end
