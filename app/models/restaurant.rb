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

  def average
    sum = 0
    reviews.each do |review|
    sum+=review.rating
    end
    sum/reviews.count
  end

end
