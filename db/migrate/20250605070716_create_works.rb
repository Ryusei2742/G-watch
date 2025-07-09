class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|
      t.string :title
      t.text :description
      t.integer :year
      t.string :series

      t.timestamps
    end
  end
end
