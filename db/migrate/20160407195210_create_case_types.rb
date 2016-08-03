class CreateCaseTypes < ActiveRecord::Migration
  def change
    create_table :case_types do |t|
      t.string :tipoCaso

      t.timestamps null: false
    end
  end
end
