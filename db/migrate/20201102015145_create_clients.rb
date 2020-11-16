class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :nombre
      t.string :telefono
      t.string :email
      t.string :direccion

      t.timestamps
    end
  end
end
