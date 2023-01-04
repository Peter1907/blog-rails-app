require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  before :all do
    @user1 = User.create(name: 'user1', photo: 'https://images.com/image1.jpg', bio: 'bio1')
    @user2 = User.create(name: 'user2', photo: 'https://images.com/image2.jpg', bio: 'bio2')
    @post1 = Post.create(title: 'post1', text: 'text1', author_id: @user1.id)
    @comment1 = Comment.create(text: 'comment1', author_id: @user2.id, post_id: @post1.id)
    @comment2 = Comment.create(text: 'comment2', author_id: @user2.id, post_id: @post1.id)
    @comment3 = Comment.create(text: 'comment3', author_id: @user2.id, post_id: @post1.id)
    @comment4 = Comment.create(text: 'comment4', author_id: @user2.id, post_id: @post1.id)
    @comment5 = Comment.create(text: 'comment5', author_id: @user2.id, post_id: @post1.id)
    @comment6 = Comment.create(text: 'comment6', author_id: @user2.id, post_id: @post1.id)
    Like.create(author_id: @user2.id, post_id: @post1.id)
  end

  it 'displays the post\'s title' do
    visit user_post_path(@user1, @post1)
    expect(page).to have_content('post1')
  end

  it 'displays who wrote the post' do
    visit user_post_path(@user1, @post1)
    expect(page).to have_content('user1')
  end

  it 'displays how many commnets the post has' do
    visit user_post_path(@user1, @post1)
    expect(page).to have_content('comments: 6')
  end

  it 'displays how many likes the post has' do
    visit user_post_path(@user1, @post1)
    expect(page).to have_content('likes: 1')
  end

  it 'displays the post\'s body' do
    visit user_posts_path(@user1)
    expect(page).to have_content('text1')
  end

  it 'displays the username of each commentor' do
    visit user_post_path(@user1, @post1)
    expect(page).to have_content('user2')
  end

  it 'displays all the comments each commentor left' do
    visit user_post_path(@user1, @post1)
    expect(page).to have_content('comment1')
    expect(page).to have_content('comment2')
    expect(page).to have_content('comment3')
    expect(page).to have_content('comment4')
    expect(page).to have_content('comment5')
    expect(page).to have_content('comment6')
  end
end
