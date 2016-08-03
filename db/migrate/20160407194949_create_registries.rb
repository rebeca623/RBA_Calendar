class CreateRegistries < ActiveRecord::Migration
  def change
    create_table :registries do |t|
      t.date :fecha

      t.timestamps null: false
    end
  end
end
