require 'rails_helper'

RSpec.describe 'Works', type: :request do
  describe 'GET /works' do
    it 'returns http success' do
      get works_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /works/:id' do
    it 'returns http success' do
      work = create(:work)

      get work_path(work)

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /works/new' do
    it 'returns http success for admins' do
      admin = create(:user, :admin)
      post login_path, params: { email: admin.email, password: 'password' }

      get new_work_path

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /works/:id/edit' do
    it 'returns http success for admins' do
      admin = create(:user, :admin)
      work = create(:work)
      post login_path, params: { email: admin.email, password: 'password' }

      get edit_work_path(work)

      expect(response).to have_http_status(:success)
    end
  end
end
