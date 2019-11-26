class Category < ApplicationRecord

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true

  has_many :words, dependent: :destroy

  has_many :lessons, dependent: :destroy

end
