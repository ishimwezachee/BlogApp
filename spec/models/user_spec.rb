require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Created user' do
    subject { User.new(name: 'user_name', photo: 'sample.png', bio: 'Teacher from Mexico.', post_counter: 3) }

    before { subject.save }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'name should be present' do
      subject.name = nil
      expect(subject).to be_valid
    end

    it 'photo should be present' do
      subject.photo = nil
      expect(subject).to be_valid
    end

    it 'Bio should be present' do
      subject.bio = nil
      expect(subject).to be_valid
    end

    it 'Post counter should be present' do
      subject.bio = nil
      expect(subject).to be_valid
    end

    it 'User should have three recent posts' do
      expect(subject.recent_posts).to eq(subject.posts.last(3))
    end
  end
end
