class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.references :company, foreign_key: true, null: false

      t.timestamps
    end
    add_index :products, [:company_id, :name], unique: true
  end
end
