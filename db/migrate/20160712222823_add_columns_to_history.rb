class AddColumnsToHistory < ActiveRecord::Migration
  def change
  	add_column :histories, :user_id, :integer
  	add_column :histories, :action_id, :integer
  end
end
