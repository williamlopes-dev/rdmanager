class CreateCompanyCurrencies < ActiveRecord::Migration[5.1]
  def change
    create_table :company_currencies, id: false do |t|
      t.references :company, foreign_key: true
      t.references :currency, foreign_key: true
      t.integer :decimal_places
    end
    add_index :company_currencies, [:company_id, :currency_id], unique: true
  end
end
