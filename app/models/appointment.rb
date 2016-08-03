class Appointment < ActiveRecord::Base
	belongs_to :user
	belongs_to :client
	belongs_to :case_type
end
