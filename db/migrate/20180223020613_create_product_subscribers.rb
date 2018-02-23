class CreateProductSubscribers < ActiveRecord::Migration[5.1]
  def change
    create_table :product_subscribers do |t|
      t.references :company, foreign_key: true
      t.references :product_price, foreign_key: true
      t.boolean :is_manager
      t.boolean :is_payer

      t.timestamps
    end
  end
end