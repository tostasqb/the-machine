class CreateCoins < ActiveRecord::Migration[6.0]
  def change
    create_table :coins do |t|
      t.string :name
      t.decimal :value
      t.integer :quantity

      t.timestamps
    end
  end
end
