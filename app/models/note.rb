# frozen_string_literal: true

class Note < ApplicationRecord
  NUMBER_OF_CHARS_FOR_NUMBER = 16

  scope :published, -> { where.not(published_at: nil) }

  before_validation :set_uniq_number

  validates :number, presence: true, uniqueness: true
  validates :title, presence: true

  private

  def set_uniq_number
    num = nil
    loop do
      num = SecureRandom.alphanumeric(NUMBER_OF_CHARS_FOR_NUMBER)
      break unless self.class.exists?(number: num)
    end
    self.number = num
  end
end
