class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :work, null: false, foreign_key: true
      t.string :status
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
