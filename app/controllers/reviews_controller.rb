class ReviewsController < ApplicationController
  def create
    @work = Work.find(params[:work_id])
    @review = @work.reviews.new(review_params)
    if @review.save
      redirect_to @work, notice: "レビューを投稿しました。"
    else
      @reviews = @work.reviews.order(created_at: :desc)
      @avg_rating = @reviews.average(:rating)&.round(1)
      flash.now[:alert] = '投稿に失敗しました。'
      render 'works/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :status, :rating, :comment)
  end
end
