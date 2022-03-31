class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    like = @post.likes.create(
      author_id: current_user.id,
      post_id: @post.id
    )
    like.update_like_counter
    if like.save
      flash[:notice] = 'Saved successfully'
    else
      flash[:error] = 'Failed to create, try again!'
    end
    redirect_to "/users/#{@post.author_id}/posts/#{@post.id}"
  end
end
