class ReadingCard < ApplicationRecord
  belongs_to :reading
  belongs_to :tarot_card

  def orientation
    position == 1 ? "upright" : "reversed"
  end
  
end
