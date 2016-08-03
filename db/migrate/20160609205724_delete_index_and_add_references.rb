class DeleteIndexAndAddReferences < ActiveRecord::Migration
  def change
  		drop_table(HasCaseType)
  end
end
