# frozen_string_literal: true

# base card class
class Card
  attr_accessor :card_number_string

  UNKNOWN = 'Unknown'

  def initialize(card_number_string)
    @card_number_string = card_number_string
  end

  def valid_length?
    # part of the first check, each card type implements this method
    false
  end

  def valid_checksum?
    # This is the second check
    # apply the algorithm to see if card total is multiple of 10
    # as this check is common to all cards

    # split card number into array and reverse it (length may vary)
    reversed = @card_number_string.reverse.split('')

    # double every second element
    double_alternating = reversed.map.with_index do |digit, index|
      if (index + 1).even?
        doubled = digit.to_i * 2
        if doubled > 9
          split = doubled.to_s.split('').map(&:to_i)
          split
        else
          doubled
        end
      else
        digit.to_i
      end
    end

    return true if (double_alternating.flatten.sum % 10).zero?

    false
  end

  def validity
    return '(Invalid card type)' if type == UNKNOWN

    errors = []
    errors << "Invalid length #{@card_number.to_s.length}" unless valid_length?
    errors << 'Invalid checksum' unless valid_checksum?

    return "(Invalid: #{errors})" if errors.any?

    '(Valid)'
  end

  def colour
    UNKNOWN
  end

  def type
    return "Fly Buys #{colour}" unless colour == UNKNOWN

    UNKNOWN
  end
end
