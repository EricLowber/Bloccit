class FavoritesController < ApplicationController

def create
  @post = Post.find(params[:post_id])
  favorite = current_user.favorites.build(post: @post)
  authorize favorite
  if favorite.save
    flash[:notice] = 'Favorited post'
    redirect_to [@post.topic, @post]
  else
    flash[:notice] = 'Post was not favorited'
    redirect_to [@post.topic, @post]
  end
 end

 def destroy
  @post = Post.find(params[:post_id])
  favorite = current_user.favorites.find(params[:id])
  authorize favorite
   if favorite.destroy
   flash[:notice] = 'Unfavorited'
   redirect_to [@post.topic, @post]
   else
   flash[:notice] = 'Cannot remove favorite.'
   redirect_to [@post.topic, @post]
   end
  end
end


