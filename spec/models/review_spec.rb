require 'rails_helper'

RSpec.describe Review, type: :model do
  it 'is valid with a user' do
    review = build(:review)

    expect(review).to be_valid
  end

  it 'is invalid without a user' do
    review = build(:review, user: nil)

    expect(review).to be_invalid
  end
end
