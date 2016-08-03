class AddColumnColorSecToColor < ActiveRecord::Migration
  def change
  	add_column :colors, :colorsec, :string
  end
end
