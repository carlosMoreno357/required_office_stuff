 class Comment < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates :description, presence: true
end