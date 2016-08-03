class AddColumnUsedToColor < ActiveRecord::Migration
  def change
  	add_column :colors, :used, :boolean
  end
end
