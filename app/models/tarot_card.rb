class TarotCard < ApplicationRecord
    has_many :reading_cards
    has_many :readings, through: :reading_cards
end
