class ChangeHourToString < ActiveRecord::Migration
  def change
  	change_column :appointments, :hora, :string
  end
end
