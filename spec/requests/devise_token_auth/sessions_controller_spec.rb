require 'swagger_helper'

RSpec.describe DeviseTokenAuth::SessionsController, type: :request do
  path '/api/v1/auth/sign_in' do
    post 'Authenticate user' do
      tags 'Authentication'
      consumes 'application/json'
      parameter name: :authentication, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: ['email', 'password']
      }

      response '200', 'user authenticated' do
        let(:user) { create(:user, email: 'test@example.com', password: 'password') }
        let(:authentication) { { email: 'test@example.com', password: 'password' } }

        run_test!
      end

      response '401', 'invalid credentials' do
        let(:authentication) { { email: 'invalid@example.com', password: 'invalid_password' } }

        run_test!
      end
    end
  end
end
