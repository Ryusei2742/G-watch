class ReviewsController < ApplicationController
  before_action :require_login

  def create
    @work = Work.find(params[:work_id])
    @review = @work.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @work, notice: 'レビューを投稿しました。'
    else
      @reviews = @work.reviews.order(created_at: :desc)
      @avg_rating = @reviews.average(:rating)&.round(1)
      flash.now[:alert] = '投稿に失敗しました。'
      render 'works/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:status, :rating, :comment)
  end
end
