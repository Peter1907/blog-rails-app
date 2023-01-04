require 'rails_helper'

RSpec.describe 'Posts index view', type: :feature do
  before :all do
    @user1 = User.create(name: 'user1', photo: 'https://images.com/image1.jpg', bio: 'bio1')
    @user2 = User.create(name: 'user2', photo: 'https://images.com/image2.jpg', bio: 'bio2')
    @post1 = Post.create(title: 'post1', text: 'text1', author_id: @user1.id)
    @post2 = Post.create(title: 'post2', text: 'text2', author_id: @user1.id)
    @post3 = Post.create(title: 'post3', text: 'text3', author_id: @user1.id)
    @post4 = Post.create(title: 'post4', text: 'text4', author_id: @user1.id)
    @comment1 = Comment.create(text: 'comment1', author_id: @user2.id, post_id: @post1.id)
    @comment2 = Comment.create(text: 'comment2', author_id: @user2.id, post_id: @post1.id)
    @comment3 = Comment.create(text: 'comment3', author_id: @user2.id, post_id: @post1.id)
    @comment4 = Comment.create(text: 'comment4', author_id: @user2.id, post_id: @post1.id)
    @comment5 = Comment.create(text: 'comment5', author_id: @user2.id, post_id: @post1.id)
    @comment6 = Comment.create(text: 'comment6', author_id: @user2.id, post_id: @post1.id)
  end

  it 'shows the profile picture of the user' do
    visit user_posts_path(@user1)
    expect(page).to have_css("img[src='https://images.com/image1.jpg']")
  end

  it 'shows the user\'s name' do
    visit user_posts_path(@user1)
    expect(page).to have_content('user1')
  end
  
  it 'displays the number of posts for the user' do
    visit user_posts_path(@user1)
    expect(page).to have_content('Number of posts: 4')
  end

  it 'displays the post\'s title' do
    visit user_posts_path(@user1)
    expect(page).to have_content('post1')
  end

  it 'displays the post\'s body' do
    visit user_posts_path(@user1)
    expect(page).to have_content('text1')
  end

  it 'displays the last 5 comments' do
    visit user_posts_path(@user1)
    expect(page).to have_content('user2: comment2')
    expect(page).to have_content('user2: comment3')
    expect(page).to have_content('user2: comment4')
    expect(page).to have_content('user2: comment5')
    expect(page).to have_content('user2: comment6')
  end

  it 'displays the number of comments a post has' do
    visit user_posts_path(@user1)
    expect(page).to have_content('comments: 6')
  end

  it 'redirects to the show page of a specific post' do
    visit user_posts_path(@user1)
    click_link('post #1')
    expect(page).to have_current_path(user_post_path(@user1, @post1))
  end
end
