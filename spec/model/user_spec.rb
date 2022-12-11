require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(name: 'user_1', photo: 'photo_1', bio: 'bio_1')

  before { user.save }

  it 'should have a name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'should have a post_counter greater than or equal to 0' do
    expect(user.posts_counter).to be >= 0
  end
end
