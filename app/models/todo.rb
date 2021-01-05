class Todo < ApplicationRecord
  belongs_to :user

  validates :todo, presence: true, length: {minimum: 1, maximum: 30}
end
