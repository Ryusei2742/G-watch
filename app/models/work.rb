class Work < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
