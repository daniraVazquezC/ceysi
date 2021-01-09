class RemoveOrderNumberFromTransactions < ActiveRecord::Migration[6.0]
  def change
    remove_column :transactions, :order_number, :string
    add_column :transactions, :comments, :text
  end
end
