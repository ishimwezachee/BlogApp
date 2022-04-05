class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comment_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :author, class_name: 'User'

  def update_posts_counter
    author.update(post_counter: author.posts.count)
  end

  def recent_five_comments
    comments.limit(5).order(created_at: :desc)
  end
end
