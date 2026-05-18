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

  describe 'PATCH /works/:id' do
    it 'updates a work for admins' do
      admin = create(:user, :admin)
      work = create(:work)
      post login_path, params: { email: admin.email, password: 'password' }

      patch work_path(work), params: { work: { title: 'Updated Work' } }

      expect(response).to redirect_to(work_path(work))
      expect(work.reload.title).to eq('Updated Work')
    end
  end

  describe 'DELETE /works/:id' do
    it 'deletes a work for admins' do
      admin = create(:user, :admin)
      work = create(:work)
      post login_path, params: { email: admin.email, password: 'password' }

      expect {
        delete work_path(work)
      }.to change(Work, :count).by(-1)
      expect(response).to redirect_to(works_path)
    end
  end
end
