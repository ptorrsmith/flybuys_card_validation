# frozen_string_literal: true

require_relative 'card'

# for Red cards
class CardRed < Card
  def colour
    'Red'
  end

  def valid_length?
    @card_number_string.length == 16
  end
end
