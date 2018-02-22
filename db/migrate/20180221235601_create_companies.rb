class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :cnpj
      t.string :name

      t.timestamps
    end
    add_index :companies, :cnpj, unique: true
  end
end
