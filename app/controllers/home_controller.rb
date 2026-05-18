class HomeController < ApplicationController
  def index
    @recommended_works = Work.where.not(recommended: true).order(recommended: :desc).limit(5)
    @latest_works = Work.order(created_at: :desc).limit(5)
  end
end
