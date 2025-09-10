class AddRecommendedAndThumbnailToWorks < ActiveRecord::Migration[6.1]
  def change
    add_column :works, :recommended, :string
    add_column :works, :thumbnail, :string
  end
end
