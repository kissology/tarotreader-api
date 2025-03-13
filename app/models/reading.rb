class Reading < ApplicationRecord
  belongs_to :client, class_name: 'User', foreign_key: 'client_id'
  belongs_to :reading_type
  has_many :reading_cards, dependent: :destroy
  has_many :tarot_cards, through: :reading_cards

  validates :reading_type_id, presence: true
  validate :validate_spread_count

  REQUIRED_CARDS = {
    1 => 1,  # One-card spread
    2 => 3,  # Three-card spread
    3 => 5,  # Five-card spread
    4 => 10  # Celtic Cross spread
  }.freeze

  def validate_spread_count 
    expected_count = REQUIRED_CARDS[reading_type_id]
    return if expected_count.nil?
  
    actual_count = reading_cards.size
  
    if actual_count != expected_count
      errors.add(:tarot_cards, "must include exactly #{expected_count} card(s) for this spread type. Provided: #{actual_count}")
    end
  end
  
end

