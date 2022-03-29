require 'rails_helper'

# status
RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get users_path }
    it 'Successfuly get route' do
      expect(response).to have_http_status(:ok)
    end

    it "Renders 'index' template for users" do
      expect(response).to render_template('index')
    end
    it 'Checks if users/index html elements rendered' do
      expect(response.body).to include('USER1 data')
    end
  end
  describe 'GET /show' do
    before(:example) { get user_path(1) }

    it 'Response staturs correct' do
      expect(response).to have_http_status(:success)
    end
    it "Renders 'show' template for users" do
      expect(response).to render_template('show')
    end
    it 'Checks if response body includes correct placeholder text' do
      expect(response.body).to include('List of Users')
    end
  end
end
