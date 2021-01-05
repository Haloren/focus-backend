class Todo < ApplicationRecord
  belongs_to :user

  validates :item, presence: true, length: {minimum: 1, maximum: 30}
end
