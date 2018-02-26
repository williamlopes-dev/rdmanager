class CreateCompanyCurrencies < ActiveRecord::Migration[5.1]
  def change
    create_table :company_currencies do |t|
      t.references :company, foreign_key: true, null: false
      t.references :currency, foreign_key: true, null: false
      t.integer :decimal_places, null: false
    end
    add_index :company_currencies, [:company_id, :currency_id], unique: true
  end
end
