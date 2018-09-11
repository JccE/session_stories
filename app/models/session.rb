class Session < ApplicationRecord

  belongs_to :user
  has_many :products

  validates :title, presence: true
  validates :title, length: {minimum: 3}
  validates :description, presence: true
  validates :description, length: {minimum: 5}
end
