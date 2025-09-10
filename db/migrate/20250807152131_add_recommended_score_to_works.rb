class AddRecommendedScoreToWorks < ActiveRecord::Migration[6.1]
  def change
    add_column :works, :recommended_score, :decimal, precision: 2, scale: 1
  end
end
