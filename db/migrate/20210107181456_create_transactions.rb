class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :order_number
      t.string :type
      # Comentario: Esto crea una relación con la tabla de usuarios
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
