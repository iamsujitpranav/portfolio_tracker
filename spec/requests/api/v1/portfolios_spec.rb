require 'swagger_helper'

RSpec.describe 'api/v1/portfolios', type: :request do
  let(:user) { create(:user) }

  describe 'Portfolios API' do 

    before(:each) do
      @portfolio = create(:portfolio, :with_stock_and_trades)
    end

    path '/api/v1/portfolios/{id}' do
      get 'Fetches a portfolio' do
        tags 'Portfolio'
        produces 'application/json', 'application/xml'
        parameter name: :id, in: :path, type: :string
        
        security [bearerAuth: []]
        parameter name: 'Authorization', in: :header, type: :string, description: 'Bearer Token', required: true
        

        response '200', 'portfolio found' do
          schema type: :object,
            properties: {
              id: { type: :integer },
              Authorization: {type: :string}
            },
            required: [ 'id', 'Authorization']

           let(:id) { @portfolio.id }

          run_test!
        end

        response '404', 'Portfolio not found' do
          let(:id) { 'invalid' }

          run_test!
        end
  
        response '406', 'unsupported accept header' do
          let(:'Accept') { 'application/foo' }

          run_test!
        end
      end

      path '/api/v1/portfolios/{id}/holdings' do
        get 'Fetches holdings for a portfolio' do
          tags 'Portfolio'
          produces 'application/json', 'application/xml'
          parameter name: :id, in: :path, type: :string
          
          security [bearerAuth: []]
          parameter name: 'Authorization', in: :header, type: :string, description: 'Bearer Token', required: true
        

          response '200', 'holdings found' do
            let(:id) { @portfolio.id }

            run_test!
          end
  
          response '404', 'Portfolio not found' do
            let(:id) { 'invalid' }

            run_test!
          end
  
          response '406', 'unsupported accept header' do
            let(:'Accept') { 'application/foo' }

            run_test!
          end
        end
      end
  
      path '/api/v1/portfolios/{id}/returns' do
        get 'Fetches cumulative returns for a portfolio' do
          tags 'Portfolio'
          produces 'application/json', 'application/xml'
          parameter name: :id, in: :path, type: :string
          
          security [bearerAuth: []]
          parameter name: 'Authorization', in: :header, type: :string, description: 'Bearer Token', required: true

  
          response '200', 'returns found' do
            let(:id) { @portfolio.id }

            run_test!
          end
  
          response '404', 'Portfolio not found' do
            let(:id) { 'invalid' }

            run_test!
          end
  
          response '406', 'unsupported accept header' do
            let(:'Accept') { 'application/foo' }

            run_test!
          end
        end
      end
    end
  end
end