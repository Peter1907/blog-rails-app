class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_post_comments_count
  after_destroy :update_post_comments_count

  private

  def update_post_comments_count
    post.comments_counter = post.comments.count
  end
end
