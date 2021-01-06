# Comentario: Crea la tabla de productos
class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_code
      t.string :name
      t.integer :initial_stock, default: 0, null: false
      t.integer :stock, default: 0, null: false
      t.float :price, default: 0.0, null: false
      t.boolean :with_minimum_stock, default: false
      t.integer :minimum_stock, default: 0
      t.timestamps
    end
  end
end
