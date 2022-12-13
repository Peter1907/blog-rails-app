require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @user = User.new(name: 'user_1', photo: 'photo_1', bio: 'bio_1')
    @post = Post.new(title: 'post_1', text: 'text_1', author: @user)
  end

  it 'should increment likes_counter by 1' do
    @post.increment!(:likes_counter)
    expect(@post.likes_counter).to eq(1)
  end
end
