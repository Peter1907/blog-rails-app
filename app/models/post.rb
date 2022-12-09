class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  def last_5_comments
    comments.last(5)
  end

  def update_comments_count
    update(comments_counter: comments.count)
  end

  def update_likes_count
    update(likes_counter: likes.count)
  end
end
