require 'rails_helper'

RSpec.describe User, type: :model do
  user_1 = User.new(name: 'user_1', photo: 'photo_1', bio: 'bio_1')

  before { user_1.save }

  it 'should have a name' do
    user_1.name = nil
    expect(user_1).to_not be_valid
  end

  it 'should have a post_counter greater than or equal to 0' do
    expect(user_1.posts_counter).to be >= 0
  end
end
