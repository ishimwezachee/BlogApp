require 'rails_helper'

RSpec.describe Post, type: :model do
  first_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
  subject { Post.create(author_id:first_user,title: 'Hello', text: 'This is my post', comment_counter:5,likes_counter:3) }

  before { subject.save }

  it "check post validation with valid attributes" do
    expect(subject).to_not be_valid
  end

  it 'Title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Text should be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'comment_couter greater than zero' do
      subject.comment_counter  = 0
      expect(subject).to_not be_valid
  end

  it 'Like_couter greater than zero' do
    subject.likes_counter = 0
    expect(subject).to_not be_valid
  end

  it 'Should retun the update post' do
    expect(Post.count).to eq 0
  end




  describe 'Should test methods in post model' do
    it 'Should retun the recent five comments' do
      expect(subject.recent_five_comments).to eq(subject.comments.last(5))
    end
  end
end