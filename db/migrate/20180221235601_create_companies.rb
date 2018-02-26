class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :cnpj, null: false
      t.string :name, null: false

      t.timestamps
    end
    add_index :companies, :cnpj, unique: true
  end
end
