class Comment < ApplicationRecord
  belongs_to :User
  belongs_to :Post
end