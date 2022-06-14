class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  after_save :comments_counter

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
