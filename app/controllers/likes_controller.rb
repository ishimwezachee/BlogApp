class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    like = @post.likes.create(
      author_id: current_user.id,
      post_id: @post.id
    )
    like.update_like_counter
    if like.save
      redirect_to "/users/#{@post.author_id}/posts/#{@post.id}",flash:{alert:"Like is created successfully"} 
    else
      redirect_to "/users/#{@post.author_id}/posts/#{@post.id}", flash.now[:error] = 'Failed to create Like'
    end
  end
end
