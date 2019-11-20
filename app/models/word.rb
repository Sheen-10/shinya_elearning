class Word < ApplicationRecord
  belongs_to :category
  has_many :choices, dependent: :destroy

  accepts_nested_attributes_for :choices

  def correct_answer
    choices.find_by(isCorrect:true).content
  end
end
