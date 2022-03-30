class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_comment_counter
    post.update(comment_counter: post.comments.count)
  end
end
