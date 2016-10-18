require 'rails_helper'

RSpec.describe 'Requests', type: :request do
  describe 'GET /requests/new' do
    it 'renders list of beers with view more links' do
      Beer.create(
        name: 'Hitachino',
        url: 'http://example.com'
      )

      env = {
        HTTP_AUTHORIZATION: ActionController::HttpAuthentication::Basic.encode_credentials(
          ENV['HTTP_BASIC_AUTH_USERNAME'],
          ENV['HTTP_BASIC_AUTH_PASSWORD']
        )
      }
      get new_request_path, env: env

      expect(response).to have_http_status(200)
      expect(response.body).to include(
        '<li>Hitachino <a target="_blank" href="http://example.com">View More</a></li>'
      )
    end
  end
end
