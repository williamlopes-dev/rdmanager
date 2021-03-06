class CreateProductPrices < ActiveRecord::Migration[5.1]
  def change
    create_table :product_prices do |t|
      t.references :product, foreign_key: true, null: false
      t.references :currency, foreign_key: true, null: false
      t.integer :price, null: false

      t.timestamps
    end
    add_index :product_prices, [:product_id, :currency_id], unique: true
  end
end
