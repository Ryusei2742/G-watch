require 'rails_helper'

RSpec.describe 'Reviews', type: :request do
  describe 'DELETE /reviews/:id' do
    it 'deletes the current user review' do
      user = create(:user)
      review = create(:review, user: user)

      post login_path, params: { email: user.email, password: 'password' }

      expect {
        delete review_path(review)
      }.to change(Review, :count).by(-1)
      expect(response).to redirect_to(work_path(review.work))
    end

    it 'does not delete another user review' do
      user = create(:user)
      other_review = create(:review)

      post login_path, params: { email: user.email, password: 'password' }

      expect {
        delete review_path(other_review)
      }.not_to change(Review, :count)
      expect(response).to redirect_to(reviews_path)
    end
  end
end
