class AddEmployeeIdToUser < ActiveRecord::Migration
  def change
  	add_reference :users, :employee, index: true, foreign_key: true
  end
end
