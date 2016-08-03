class History < ActiveRecord::Base
	belongs_to :user
	belongs_to :action

	has_many :appointment, through: :user
end
