require 'swagger_helper'

RSpec.describe V1::TradesController, type: :request do
  before(:each) do
    @stock = create(:stock, :with_trades)
  end
  
  let(:user) { create(:user) }

  path '/api/v1/trades' do
    post 'Creates a trade' do
      tags 'Trades'
      consumes 'application/json'

      parameter name: :trade, in: :body, schema: {
        type: :object,
        properties: {
          date: { type: :string, format: :date, example: '2024-01-16' },
          price: { type: :number, example: 100.5 },
          trade_type: { type: :string, enum: ['buy', 'sell'], example: 'buy' },
          quantity: { type: :integer, example: 100 },
          stock_id: {type: :integer, example: 1}
        },
        required: ['date', 'price', 'trade_type', 'quantity', 'stock_id']
      }

      security [bearerAuth: []]
      parameter name: 'Authorization', in: :header, type: :string, description: 'Bearer Token', required: true
      let(:Authorization) {@user.create_new_auth_token['Authorization']}

      response '200', 'trade created successfully' do
        let(:trade) { { date: '2024-01-16', price: 100.5, trade_type: 'buy', quantity: 100, stock_id: @stock.id } }
        

        run_test!
      end

      response '422', 'invalid trade parameters' do
        let(:trade) { { date: 'invalid_date' } }

        run_test!
      end
    end
  end

  path '/api/v1/trades/{id}' do
    parameter name: :id, in: :path, type: :integer

        

    put 'Updates a trade' do
      tags 'Trades'
      consumes 'application/json'
      parameter name: :trade, in: :body, schema: {
        type: :object,
        properties: {
          date: { type: :string, format: :date, example: '2024-01-16' },
          price: { type: :number, example: 120.0 },
          trade_type: { type: :string, enum: ['buy', 'sell'], example: 'sell' },
          quantity: { type: :integer, example: 50 }
        }
      }
      security [bearerAuth: []]
      parameter name: 'Authorization', in: :header, type: :string, description: 'Bearer Token', required: true
      let(:Authorization) {@user.create_new_auth_token['Authorization']}

      response '200', 'trade updated successfully' do
        let(:id) { create(:trade).id }
        let(:trade) { { price: 120.0, trade_type: 'sell', quantity: 50 } }

        run_test!
      end

      response '404', 'trade not found' do
        let(:id) { 'invalid_id' }
        let(:trade) { { price: 120.0, trade_type: 'sell', quantity: 50 } }
        run_test!
      end
    end

    delete 'Removes a trade' do
      tags 'Trades'
      produces 'application/json'

      security [bearerAuth: []]
      parameter name: 'Authorization', in: :header, type: :string, description: 'Bearer Token', required: true
      let(:Authorization) {@user.create_new_auth_token['Authorization']}
      
      response '200', 'trade removed successfully' do
        let(:id) { create(:trade).id }

        run_test!
      end

      response '404', 'trade not found' do
        let(:id) { 'invalid_id' }

        run_test!
      end
    end
  end
end
