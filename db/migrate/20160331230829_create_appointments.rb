class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :numpersonas
      t.date :fecha
      t.time :hora
      t.text :comentario

      t.timestamps null: false
    end
  end
end
