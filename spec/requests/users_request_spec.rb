require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before { get root_path }

    it { should redirect_to(login_path) }
  end

  describe 'GET #login' do
    before { get login_path }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it { should render_template('new') }
  end
end
