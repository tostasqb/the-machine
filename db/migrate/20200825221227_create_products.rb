class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.integer :quantity
      t.integer :quantity_sold, default: 0

      t.timestamps
    end
  end
end
