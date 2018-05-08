# frozen_string_literal: true

require 'uri'

class Link < ApplicationRecord
  validates :url, presence: true

  validate :url_is_looking_like_url

  after_create :set_short_url

  def url_is_looking_like_url
    errors.add(:url, 'not valid') unless url&.match?(URI::DEFAULT_PARSER.regexp[:ABS_URI])
  end

  def set_short_url
    hashids = Hashids.new('this is my salt', 6)
    self.short_url = hashids.encode(id)
  end
end
