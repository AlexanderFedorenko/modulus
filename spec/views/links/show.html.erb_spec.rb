# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'links/show', type: :view do
  before(:each) do
    @link = assign(:link, Link.create!(
                            url: 'Url',
                            short_url: 'Short Url'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/Short Url/)
  end
end
