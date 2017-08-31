class CreateItemPurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :item_purchases do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :price
      t.integer :total
      t.integer :quantity

      t.timestamps
    end
  end
end
