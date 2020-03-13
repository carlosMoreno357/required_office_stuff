class Item < ApplicationRecord
    validates :description, presence: true
    belongs_to :category
    enum status: {fulfilled: 0, open: 1, dismissed: 2}
end