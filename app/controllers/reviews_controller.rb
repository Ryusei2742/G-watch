class ReviewsController < ApplicationController
  before_action :require_login
  before_action :set_review, only: %i[destroy]

  def index
    @reviews = current_user.reviews.includes(:work).order(created_at: :desc)
  end

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

  def destroy
    work = @review.work
    @review.destroy

    redirect_back fallback_location: work_path(work), notice: 'レビューを削除しました。'
  end

  private

  def set_review
    @review = Review.find(params[:id])
    return if @review.user == current_user

    redirect_to reviews_path, alert: 'このレビューを削除する権限がありません。'
  end

  def review_params
    params.require(:review).permit(:status, :rating, :comment)
  end
end
