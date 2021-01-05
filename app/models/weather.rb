class Weather < ApplicationRecord
  belongs_to :user

  validates :zip, presence: true, length: { is: 5 }
end
