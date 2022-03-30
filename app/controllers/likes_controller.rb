class LikesController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @user = User.find(params[:id])
        like = @post.likes.new(
          author_id: @user.id,
          post_id: @post.id
        )
        like.update_like_counter
        if like.save
          redirect_to "/users/#{@post.author_id}/posts/#{@post.id}", notice: 'Success!'
        else
          redirect_to "/users/#{@post.author_id}/posts/#{@post.id}", alert: 'Error occured!'
        end
      end
end
