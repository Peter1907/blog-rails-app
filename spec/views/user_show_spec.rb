require 'rails_helper'

RSpec.describe 'User show view', type: :feature do
  before :all do
    @user1 = User.create(name: 'user1', photo: 'https://images.com/image1.jpg', bio: 'bio1')
    @user2 = User.create(name: 'user2', photo: 'https://images.com/image2.jpg', bio: 'bio2')
    @post1 = Post.create(title: 'post1', text: 'text1', author_id: @user1.id)
    @post2 = Post.create(title: 'post2', text: 'text2', author_id: @user1.id)
    @post3 = Post.create(title: 'post3', text: 'text3', author_id: @user1.id)
    @post4 = Post.create(title: 'post4', text: 'text4', author_id: @user1.id)
    @post5 = Post.create(title: 'post5', text: 'text5', author_id: @user2.id)
  end
  
  it 'shows the profile picture of the user' do
    visit user_path(@user1)
    expect(page).to have_css("img[src='https://images.com/image1.jpg']")
  end

  it 'shows the user\'s name' do
    visit user_path(@user1)
    expect(page).to have_content('user1')
  end
  
  it 'displays the number of posts for the user' do
    visit user_path(@user1)
    expect(page).to have_content('Number of posts: 4')
  end

  it 'displays the user\'s bio' do
    visit user_path(@user1)
    expect(page).to have_content('bio1')
  end

  it 'displays the user\'s first 3 posts' do
    visit user_path(@user1)
    expect(page).to have_content('post #1')
    expect(page).to have_content('post #2')
    expect(page).to have_content('post #3')
    expect(page).not_to have_content('post #4')
  end

  it 'has a button to show all posts' do
    visit user_path(@user1)
    expect(page).to have_content('See all posts')
  end

  it 'redirects to a specific post\'s show page' do
    visit user_path(@user1)
    click_link 'post #1'
    expect(page).to have_current_path(user_post_path(@user1, @post2))
  end

  it 'redirects to user\'s post\'s index page' do
    visit user_path(@user1)
    click_link 'See all posts'
    expect(page).to have_current_path(user_posts_path(@user1))
  end
end
