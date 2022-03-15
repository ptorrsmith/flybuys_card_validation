# frozen_string_literal: true

require_relative 'card'

# for Blue cards
class CardBlue < Card
  def colour
    'Blue'
  end

  def valid_length?
    @card_number_string.length == 16
  end
end
