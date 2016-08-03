class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :nombre
      t.string :apaterno
      t.string :amaterno
      t.string :direccion
      t.string :email
      t.string :telefono

      t.timestamps null: false
    end
  end
end
