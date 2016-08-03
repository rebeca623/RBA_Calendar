class CaseType < ActiveRecord::Base
	has_many :assignments
	has_many :users, :through => :assignments

	#has_and_belongs_to_many :users
	belongs_to :appointment
end