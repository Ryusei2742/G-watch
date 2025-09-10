class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def show
    @work = Work.find(params[:id])
    @reviews = @work.reviews.order(created_at: :desc)

    # 平均評価
    @avg_rating = @reviews.average(:rating)&.round(1)

    @review = @work.reviews.new
  end

  def new
    @work = Work.new
  end

  def edit
    @work = Work.find(params[:id])
  end
end
