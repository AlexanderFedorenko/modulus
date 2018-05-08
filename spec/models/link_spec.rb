# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Link, type: :model do
  it 'has valid factories' do
    expect(create(:link)).to be_valid

    expect do
      expect(create(:link_with_invalid_params)).not_to be_valid
    end.to raise_exception(ActiveRecord::RecordInvalid)
  end

  it 'creates with short_url set' do
    expect(create(:link).short_url).not_to be_empty
  end
end
