class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  def last_3_posts
    posts.last(3)
  end

  def update_post_count
    update(posts_counter: posts.count)
  end
end
