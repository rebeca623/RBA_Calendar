class CreateHasCaseTypes < ActiveRecord::Migration
  def change
    create_table :has_case_types do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :case_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
