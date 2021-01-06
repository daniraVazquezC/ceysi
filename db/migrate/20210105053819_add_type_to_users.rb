# COmentario: Campos adicionales para la base de datos
class AddTypeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :role, :string
    add_column :users, :active, :boolean, default: true
  end
end
