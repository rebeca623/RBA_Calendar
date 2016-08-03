class CreateVacations < ActiveRecord::Migration
  def change
    create_table :vacations do |t|
      t.date :startDate
      t.date :endDate
      t.text :comment
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
