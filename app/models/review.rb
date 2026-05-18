class Review < ApplicationRecord
  belongs_to :user
  belongs_to :work

  validates :rating, inclusion: { in: 1..5 }, allow_nil: true
  validates :status, inclusion: { in: %w[planned watched] }, allow_nil: true
end
