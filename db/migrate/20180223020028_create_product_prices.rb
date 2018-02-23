class CreateProductPrices < ActiveRecord::Migration[5.1]
  def change
    create_table :product_prices do |t|
      t.references :product, foreign_key: true
      t.references :currency, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
