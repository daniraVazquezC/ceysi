class CreateTransactionDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :transaction_details do |t|
      # Comentario: Esto crea una relación con la tabla de transacciones
      t.belongs_to :transaction, foreign_key: true
      # Comentario: Esto crea una relación con la tabla de productos
      t.belongs_to :product, foreign_key: true
      t.integer :quantity
      t.timestamps
    end
  end
end
