class WorksController < ApplicationController
  before_action :require_login, except: %i[index show]
  before_action :set_work, only: %i[show edit update destroy]

  def index
    @works = Work.order(created_at: :desc)
  end

  def show
    @reviews = @work.reviews.order(created_at: :desc)

    # 平均評価
    @avg_rating = @reviews.average(:rating)&.round(1)

    @review = @work.reviews.new
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to @work, notice: '作品を登録しました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @work.update(work_params)
      redirect_to @work, notice: '作品を更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @work.destroy
    redirect_to works_path, notice: '作品を削除しました。'
  end

  private

  def set_work
    @work = Work.find(params[:id])
  end

  def work_params
    params.require(:work).permit(
      :title,
      :description,
      :year,
      :series,
      :recommended,
      :thumbnail
    )
  end
end
