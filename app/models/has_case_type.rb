class HasCaseType < ActiveRecord::Base
  belongs_to :user
  belongs_to :case_type
end
