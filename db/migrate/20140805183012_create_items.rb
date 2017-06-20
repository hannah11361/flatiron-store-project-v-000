class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.integer :category_id
      t.integer :inventory
      t.integer :price

      t.timestamps null: false
    end
  end
end
