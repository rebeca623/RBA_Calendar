class AddMultipleColumnsToHistory < ActiveRecord::Migration
  	def change
  		add_column :histories, :fecha, :datetime
  		add_column :histories, :client_id, :integer
  		add_column :histories, :detalles, :text
  		add_column :histories, :ubicacion, :string
  	end
end
