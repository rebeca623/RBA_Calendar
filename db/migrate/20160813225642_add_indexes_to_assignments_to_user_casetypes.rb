class AddIndexesToAssignmentsToUserCasetypes < ActiveRecord::Migration
  def change
  		add_foreign_key :assignments, :users, column: :user_id, primary_key: :id
  		add_foreign_key :assignments, :case_types, column: :case_type_id, primary_key: :id
  end
end
