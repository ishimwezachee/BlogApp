class Post <ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    belongs_to :author, class_name: 'User'
    
    def update_posts_counter
        author.update(post_counter:author.posts.count)
    end

    def recent_five_comments
        comments.limit(5).order(created_at: :desc)
    end

end