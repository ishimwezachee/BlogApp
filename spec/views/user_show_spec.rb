
# I can see the user's first 3 posts.
# When I click a user's post, it redirects me to that post's show page.
# When I click to see all posts, it redirects me to the user's post's index page.
require 'rails_helper'

RSpec.describe 'User #Show', type: :feature do
  describe 'shows users' do
        before(:each) do
            @userA = User.create(name: 'userA', bio: 'Writer', email: 'usera@example.com', password: '123456',post_counter: 0, confirmed_at: Time.now)
            @userB = User.create(name: 'userB', bio: 'footballer', email: 'userb@example.com', password: 'helloworld',post_counter: 0, confirmed_at: Time.now)

            visit root_path
            fill_in 'Email', with: 'usera@example.com'
            fill_in 'Password', with: '123456'
            click_button 'Log in'
            @posta = Post.create(title: 'first', text: 'Hello1', comment_counter: 0, likes_counter: 0, author: @userA)
            @postb = Post.create(title: 'second', text: 'Hello2', comment_counter: 0, likes_counter: 0, author: @userA)
            @postc = Post.create(title: 'third', text: 'Hello3', comment_counter: 0, likes_counter: 0, author: @userA)
            @postd = Post.create(title: 'fourth', text: 'Hello4', comment_counter: 0, likes_counter: 0, author: @userA)
            visit user_path(@userA.id)
        end

        it "show user's profile picture" do
            expect(page).to have_css('img')
          end

          it "show user's Bio" do
            expect(page).to have_content("Writer")
          end

          it "show user's name" do
            expect(page).to have_content 'userA'
          end

          it 'show number of posts user written' do
            user = User.first
            expect(page).to have_content(user.post_counter)
          end

          it "show button to see all post." do
            expect(page).to have_button('See all posts')
          end


          it "show user's first 3 posts." do
            visit(user_posts_path(@userA.id))
            expect(page).to have_content('first')
            expect(page).to have_content('second')
            expect(page).to have_content('third')
          end

          it "click see all posts and redirects to user's post's index page." do
            click_button 'See all posts'
            visit(user_posts_path(@userA.id))
            expect(page).to have_current_path user_posts_path(@userA)
          end
        
    end
end


