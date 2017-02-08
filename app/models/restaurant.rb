class Restaurant < ApplicationRecord
  #associations
  has_many :reviews, dependent: :destroy
  #validations
  CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]
  validates :name, presence: true
  validates :phone_number, presence: true
  validates :address, presence: true
  validates :category, inclusion: { in: CATEGORIES,
      message: "%{value} is not a valid category" }
end
