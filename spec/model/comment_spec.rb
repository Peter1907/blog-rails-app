require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @user = User.new(name: 'user_1', photo: 'photo_1', bio: 'bio_1')
    @post = Post.new(title: 'post_1', text: 'text_1', author: @user)
    @comment = Comment.new(author: @user, post: @post)
  end

  it 'should increment comments_counter by 1' do
    @post.increment!(:comments_counter)
    expect(@post.comments_counter).to eq(1)
  end
end
