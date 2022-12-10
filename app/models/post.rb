class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, foreign_key: :post_id
  has_many :comments, foreign_key: :post_id

  validates :title, presence: true, length: { minimum: 1, maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def last_5_comments
    comments.last(5)
  end

  after_save :update_user_posts_count
  after_destroy :update_user_posts_count

  private

  def update_user_posts_count
    author.posts_counter = author.posts.count
  end
end
