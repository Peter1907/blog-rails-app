require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.new(name: 'user_1', photo: 'photo_1', bio: 'bio_1')
  post = Post.new(author: user, text: 'content_1')

  before { user.save }
  before { post.save }

  it 'title shouldn\'t be empty' do
    post.text = nil
    expect(post).to_not be_valid
  end

  it 'title shouldn\'t exceed 250 characters' do
    post.text = 'a' * 251
    expect(post).to_not be_valid
  end

  it 'should have a comments_counter greater than or equal to 0' do
    expect(post.comments_counter).to be >= 0
  end

  it 'should have a likes_counter greater than or equal to 0' do
    expect(post.likes_counter).to be >= 0
  end
end
