require 'rails_helper'
RSpec.describe 'User #Show', type: :feature do
  describe 'shows users' do
    before(:each) do
      @usera = User.create(name: 'userA', bio: 'Writer', email: 'usera@example.com', password: '123456',
                           post_counter: 0, confirmed_at: Time.now)
      @userb = User.create(name: 'userB', bio: 'footballer', email: 'userb@example.com', password: 'helloworld',
                           post_counter: 0, confirmed_at: Time.now)

      visit root_path
      fill_in 'Email', with: 'usera@example.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      @posta = Post.create(title: 'first', text: 'Hello1', comment_counter: 0, likes_counter: 0, author: @usera)
      @postb = Post.create(title: 'Second', text: 'Hello2', comment_counter: 0, likes_counter: 0,
                           author: @usera)
      @postc = Post.create(title: 'third', text: 'Hello3', comment_counter: 0, likes_counter: 0, author: @usera)
      @postd = Post.create(title: 'fourth', text: 'Hello4', comment_counter: 0, likes_counter: 0,
                           author: @usera)
      @commenta = Comment.create(text: 'work harder!', author: User.first, post: Post.first)
      visit(user_posts_path(@usera.id))
    end

    it "shows user's profile picture" do
      expect(page).to have_css('img')
    end

    it 'shows username of the first user' do
      visit(user_posts_path(@usera.id))
      expect(page).to have_content 'userA'
    end

    it 'shows number of posts' do
      post = Post.all
      expect(post.size).to eql(4)
    end

    it 'shows number of posts of a user' do
      user = User.first
      expect(page).to have_content(user.post_counter)
    end

    it 'see the number of likes' do
      expect(page).to have_content 'likes: 0'
    end

    it 'can see how many comments a post has.' do
      post = Post.first
      expect(page).to have_content(post.comment_counter)
    end

    it 'shows commentor username' do
      visit(user_posts_path(@usera.id))
      expect(page).to have_content 'userA'
    end
  end
end
