class DropTableUsuario < ActiveRecord::Migration[5.1]
  def change
    drop_table :usuarios
  end
end
