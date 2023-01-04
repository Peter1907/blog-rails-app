require 'rails_helper'

RSpec.describe 'Users index view', type: :feature do
  before :all do
    @user1 = User.create(name: 'user1', photo: 'https://images.com/image1.jpg', bio: 'bio1')
    @user2 = User.create(name: 'user2', photo: 'https://images.com/image2.jpg', bio: 'bio2')
    @post1 = Post.create(title: 'post1', text: 'text1', author_id: @user1.id)
    @post2 = Post.create(title: 'post2', text: 'text2', author_id: @user1.id)
    @post3 = Post.create(title: 'post3', text: 'text3', author_id: @user2.id)
  end

  it 'displays all users' do
    visit users_path
    expect(page).to have_content('user1')
    expect(page).to have_content('user2')
  end

  it 'has the profile picture for each user' do
    visit users_path
    expect(page).to have_xpath("//img[contains(@src,'https://images.com/image1.jpg')]")
    expect(page).to have_css("img[src='https://images.com/image2.jpg']")
  end

  it 'displays the number of posts for each user' do
    visit users_path
    expect(page).to have_content('Number of posts: 2')
    expect(page).to have_content('Number of posts: 1')
  end

  it 'redirects to that user\'s show page' do
    visit users_path
    first(:link, 'user1').click
    expect(page).to have_content('bio1')
  end
end
