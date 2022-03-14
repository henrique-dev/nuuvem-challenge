class CreateItemPurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :item_purchases do |t|
      t.integer :count

      t.references :item, null: false, foreign_key: true
      t.references :purchase, null: false, foreign_key: true

      t.timestamps
    end
  end
end
