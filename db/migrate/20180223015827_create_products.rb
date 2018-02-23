class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.references :company, foreign_key: true

      t.timestamps
    end
    add_index :products, [:company_id, :name], unique: true
  end
end
