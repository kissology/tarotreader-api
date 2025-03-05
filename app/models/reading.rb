class Reading < ApplicationRecord
  belongs_to :client, class_name: 'User', foreign_key: 'client_id'
  belongs_to :reading_type
  has_many :reading_cards, dependent: :destroy
  has_many :tarot_cards, through: :reading_cards
end

