class ChangeColumnNameForHistory < ActiveRecord::Migration
  def change
  		rename_column :histories, :fecha, :fechaLog
  end
end
