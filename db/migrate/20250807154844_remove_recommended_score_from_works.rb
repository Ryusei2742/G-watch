class RemoveRecommendedScoreFromWorks < ActiveRecord::Migration[6.1]
  def change
    remove_column :works, :recommended_score, :decimal
  end
end
