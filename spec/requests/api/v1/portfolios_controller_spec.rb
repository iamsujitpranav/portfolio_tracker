require 'swagger_helper'

RSpec.describe V1::PortfoliosController, type: :request do

  describe 'Portfolios API' do 

    before(:each) do
      @portfolio = create(:portfolio, :with_stock_and_trades)
      @user = create(:user) 
      allow(ActionMailer::Base).to receive(:deliveries).and_return([])
      
    end

    path '/api/v1/portfolios/{id}' do
      get 'Fetches a portfolio' do
        
        tags 'Portfolio'
        consumes 'application/json'
        produces 'application/json'
        
        parameter name: :id, in: :path, type: :string
        parameter name: :Authorization, in: :header, type: :string, description: 'Bearer Token', required: true        
        
        security [bearerAuth: []]
        
        let(:Authorization) {@user.create_new_auth_token['Authorization']}
        response '200', 'portfolio found' do
          schema type: :object,
            properties: {
              message: { type: :string },
              status: {type: :integer},
              stocks: {type: :object},
              trades: {type: :object}
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
          let(:Authorization) {@user.create_new_auth_token['Authorization']}

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
          let(:Authorization) {@user.create_new_auth_token['Authorization']}
  
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