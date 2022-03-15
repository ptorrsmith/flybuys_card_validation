# frozen_string_literal: true

require_relative 'card'

# for Green cards
class CardGreen < Card
  def colour
    'Green'
  end

  def valid_length?
    @card_number_string.length == 16
  end
end
