# frozen_string_literal: true

FactoryBot.define do
  factory :link, class: Link do
    url 'https://github.com/rspec/rspec-rails'
  end

  factory :link_with_invalid_params, class: Link do
    url 'go ogle.http://com'
  end
end
