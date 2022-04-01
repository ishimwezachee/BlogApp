class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @new_post = @user.posts.create(post_params)
    @new_post.likes_counter = 0
    @new_post.comment_counter = 0
    respond_to do |f|
      f.html do
        if @new_post.save
          flash[:notice] = 'Saved successfully'
          redirect_to "/users/#{@new_post.author.id}/posts/"
        else
          flash[:error] = 'Failed to create, try again!'
        end
      end
    end
  end

  def destroy
    post = Post.find(params[:id])
    authorize! :destroy, post
    post.destroy
    redirect_to user_posts_path, notice: 'Post deleted'
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
