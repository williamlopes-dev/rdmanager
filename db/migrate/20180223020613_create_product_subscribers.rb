class CreateProductSubscribers < ActiveRecord::Migration[5.1]
  def change
    create_table :product_subscribers do |t|
      t.references :company, foreign_key: true, null: false
      t.references :product_price, foreign_key: true, null: false
      t.boolean :is_manager, null: false
      t.boolean :is_payer, null: false

      t.timestamps
    end
    add_index :product_subscribers, [:company_id, :product_price_id], unique: true
  end
end
