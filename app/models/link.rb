# frozen_string_literal: true

require 'uri'
require 'securerandom'

class Link < ApplicationRecord
  validates :url, presence: true

  validate :url_is_looking_like_url

  before_save :set_short_url

  def url_is_looking_like_url
    errors.add(:url, 'not valid') unless url&.match?(URI::DEFAULT_PARSER.regexp[:ABS_URI])
  end

  def set_short_url
    self.short_url = one_hundred_percent_true_random_string
  end

  private

  def one_hundred_percent_true_random_string
    hashids = Hashids.new('the salt', 6)
    hashids.encode((SecureRandom.random_number(9e5) + 1e5).to_i)
  end
end
