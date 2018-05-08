# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LinksController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/links/new').to route_to('links#new')
    end

    it 'routes to #show' do
      expect(get: '/links/J0MKKA').to route_to('links#show', short_url: 'J0MKKA')
    end

    it 'routes to #create' do
      expect(post: '/links').to route_to('links#create')
    end

    it 'routes to #visit' do
      expect(get: '/J0MKKA').to route_to('links#visit', short_url: 'J0MKKA')
    end
  end
end
