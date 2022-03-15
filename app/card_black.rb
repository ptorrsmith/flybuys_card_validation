# frozen_string_literal: true

require_relative 'card'

# for Black cards
class CardBlack < Card
  def colour
    'Black'
  end

  def valid_length?
    [16, 17].include?(@card_number_string.length)
  end
end
