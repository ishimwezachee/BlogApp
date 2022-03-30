class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.author
    @comments = @post.comments
  end

  def new 
    @post = Post.new
  end

  def create
    @user.find(params[:id])
    @new_post = @user.posts.(post_params)
    respond_to do |f|
      f.html do
        if @new_post.save
          redirect_to "/users/#{@new_post.author.id}/posts/"
        else
          render :new, alert: 'POst failed to create'
        end
     end
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end

end
