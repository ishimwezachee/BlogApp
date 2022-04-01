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
              @postb = Post.create(title: 'Second', text: 'Hello2', comment_counter: 0, likes_counter: 0, author: @userA)
              @postc = Post.create(title: 'third', text: 'Hello3', comment_counter: 0, likes_counter: 0, author: @userA)
              @postd = Post.create(title: 'fourth', text: 'Hello4', comment_counter: 0, likes_counter: 0, author: @userA)
              @commenta = Comment.create(text: 'work harder!', author: User.first, post: Post.first)
   
              visit user_post_path(@userA, @posta)
           end

           it 'shows posts title' do
            expect(page).to have_content('first')
          end

          it 'can see who wrote the Post' do
            expect(page).to have_content('userA')
          end

          
        it 'see how many comments' do
            post = Post.first
            expect(page).to have_content(post.comment_counter)
        end
   

        it 'can see how many likes' do
            post = Post.first
            expect(page).to have_content(post.likes_counter)
          end

          it 'can see the post body.' do
            expect(page).to have_content('Hello1')
          end

          it 'can see the username of the commentor.' do
            post = Post.first
            comment = post.comments.first
            expect(page).to have_content(comment.author.name)
          end

          it 'can see the comments of each commentor.' do
            expect(page).to have_content 'work harder!'
          end
          
end
end