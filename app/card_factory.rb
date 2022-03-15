# frozen_string_literal: true

require_relative 'card'
require_relative 'card_black'
require_relative 'card_red'
require_relative 'card_green'
require_relative 'card_blue'

# for Creating cards based on their starting digits pattern
class CardFactory
  def self.create(card_number_string)
    # This is the first check, to determine card type based on starting digits
    # Create card colour type based on regex (may still be invalid if length wrong)
    # If does not match valid starting digits, create base card
    # Each card will have a length check to see if valid

    # card_number_string = card_number.to_s # 6014 3555 2900 0028
    cleaned_card_number_string = card_number_string.scan(/\d+/).join('')

    if cleaned_card_number_string =~ /^60141/ # && [16, 17].include? card_number.length
      CardBlack.new(cleaned_card_number_string)
    elsif cleaned_card_number_string =~ /^6014352/
      CardRed.new(cleaned_card_number_string)
    elsif cleaned_card_number_string =~ /^601435552[6-9]/
      CardGreen.new(cleaned_card_number_string)
    elsif cleaned_card_number_string =~ /^6014/
      CardBlue.new(cleaned_card_number_string)
    else
      Card.new(cleaned_card_number_string)
    end
  end
end
