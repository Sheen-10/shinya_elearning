class Choice < ApplicationRecord
    belongs_to :word

    has_many :answers, dependent: :destroy
end
