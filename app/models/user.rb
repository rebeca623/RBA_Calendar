class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    belongs_to :color
    belongs_to :role
    has_many :appointment
    has_many :vacation

    has_many :assignments
    has_many :case_type, :through => :assignments

    has_many :histories
    has_many :actions, :through => :histories
    has_many :client, through: :appointment

    #has_and_belongs_to_many :case_types

    def full_name
    	 self.nombre + ' ' + self.apaterno
    end
end
