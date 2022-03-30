class CommentsController < ApplicationController
    def new 
        @new_comment = Comment.new
    end

    def create
        @post = Post.find(params[:post_id])
        @add_new_comment = @post.comments.new(comment_params)
        @add_new_comment.post_id = params[:post_id]
        @add_new_comment.update_comment_counter

        if @add_new_comment.save
            redirct_to "/users/#{@post.author_id}/posts/#{@post.id}", notice: 'comment is created successfully'
        else
            redirct_to "/users/#{@post.author_id}/posts/#{@post.id}", alert: 'Failed to create comment'
        end
    end

    def comment_params
        params.require(:comment).permit(:text)
    end
end
