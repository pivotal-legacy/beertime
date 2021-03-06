# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'RequestCreator', type: :model do
  describe 'create' do
    it 'creates a request with many beers' do
      beer1 = Beer.new(
        id: 1,
        name: 'Hitachino',
        url: 'http://example.com'
      )
      beer2 = Beer.new(
        id: 4,
        name: 'Kagua',
        url: 'http://example.com'
      )
      allow(Beer).to receive(:find).with(1).and_return(beer1)
      allow(Beer).to receive(:find).with(4).and_return(beer2)

      expect(Request).to receive(:create!).with(name: 'Bob', beer_id: 1).and_return(beer1)
      expect(Request).to receive(:create!).with(name: 'Bob', beer_id: 4).and_return(beer2)

      service = RequestCreator.new

      response = service.create(name: 'Bob', beer_ids: [1, 4])

      expect(response).to eq([beer1, beer2])
    end
  end
end
