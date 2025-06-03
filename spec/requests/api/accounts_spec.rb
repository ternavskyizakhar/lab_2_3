require 'swagger_helper'

RSpec.describe 'api/accounts', type: :request do
  path '/api/v1/accounts' do
    get 'Retrieves all accounts for a user' do
      tags 'Accounts'
      produces 'application/json'
      parameter name: :user_id, in: :query, type: :integer, description: 'User ID'

      response '200', 'accounts retrieved' do
        let(:user) { User.create(name: 'Test User', email: 'test@example.com') }
        let(:user_id) { user.id }
        let!(:accounts) { 3.times.map { Account.create(balance: 100.0, user: user) } }

        run_test! do |response|
          expect(JSON.parse(response.body).size).to eq(3)
        end
      end
    end

    post 'Creates an account' do
      tags 'Accounts'
      consumes 'application/json'
      parameter name: :account, in: :body, schema: {
        type: :object,
        properties: {
          balance: { type: :number },
          user_id: { type: :integer }
        },
        required: [ 'balance', 'user_id' ]
      }

      response '201', 'account created' do
        let(:user) { User.create(name: 'Test User', email: 'test@example.com') }
        let(:account) { { balance: 100.0, user_id: user.id } }

        run_test!
      end

      response '422', 'invalid request' do
        let(:account) { { balance: nil, user_id: nil } }

        run_test!
      end
    end
  end

  path '/api/v1/accounts/{id}' do
    get 'Retrieves a specific account' do
      tags 'Accounts'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer, description: 'Account ID'

      response '200', 'account retrieved' do
        let(:user) { User.create(name: 'Test User', email: 'test@example.com') }
        let(:account) { Account.create(balance: 100.0, user: user) }
        let(:id) { account.id }

        run_test!
      end

      response '404', 'account not found' do
        let(:id) { 'invalid' }

        run_test!
      end
    end

    put 'Updates an account' do
      tags 'Accounts'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer, description: 'Account ID'
      parameter name: :account, in: :body, schema: {
        type: :object,
        properties: {
          balance: { type: :number }
        },
        required: [ 'balance' ]
      }

      response '200', 'account updated' do
        let(:user) { User.create(name: 'Test User', email: 'test@example.com') }
        let(:account_record) { Account.create(balance: 100.0, user: user) }
        let(:id) { account_record.id }
        let(:account) { { balance: 200.0 } }

        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { User.create(name: 'Test User', email: 'test@example.com') }
        let(:account_record) { Account.create(balance: 100.0, user: user) }
        let(:id) { account_record.id }
        let(:account) { { balance: nil } }

        run_test!
      end
    end

    delete 'Deletes an account' do
      tags 'Accounts'
      parameter name: :id, in: :path, type: :integer, description: 'Account ID'

      response '204', 'account deleted' do
        let(:user) { User.create(name: 'Test User', email: 'test@example.com') }
        let(:account) { Account.create(balance: 100.0, user: user) }
        let(:id) { account.id }

        run_test!
      end

      response '404', 'account not found' do
        let(:id) { 'invalid' }

        run_test!
      end
    end
  end
end
