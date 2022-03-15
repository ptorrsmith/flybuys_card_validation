# frozen_string_literal: true

require 'csv'
require_relative 'card_factory'

# Validation app
class ValidatorApp
  def initialize(csv_file = 'cards.csv')
    @cards = []
    @csv_file = csv_file
  end

  def call
    load_cards(@csv_file)

    @cards.each do |card|
      puts "#{card.type}: #{card.card_number_string} #{card.validity}"
    end
  end

  private

  def load_cards(csv_file)
    file_name = File.join('./data', csv_file)
    card_file = File.read(file_name)
    cards = CSV.parse(card_file, headers: true)
    @cards = cards.map { |c| CardFactory.create(c['card_number']) }
  end
end
