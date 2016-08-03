class ChangeColumnTypeHour < ActiveRecord::Migration
  def change
  	change_column :appointments, :hora, :time
  end
end
