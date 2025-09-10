class ChangeRecommendedTypeInWorks < ActiveRecord::Migration[6.1]
  def change
    change_column :works, :recommended, :decimal, precision: 2, scale: 1, using: "recommended::decimal"
  end
end
