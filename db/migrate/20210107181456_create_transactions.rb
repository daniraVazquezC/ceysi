class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :order_number
      t.string :type
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
