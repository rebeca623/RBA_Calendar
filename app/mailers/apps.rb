class Apps < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.apps.notify_lawyer.subject
  #
  	def notify_lawyer(user, customer, date, hour)
	    @user = user
	    @customer = customer
	    @date = date
	    @hour = hour

	    mail to: user.email, subject: user.nombre + " " + user.apaterno + " tienes una nueva cita!"
  	end

  	def notify_client(user, customer, date, hour)
		@user = user
   		@customer = customer
    	@date = date
   		@hour = hour

   		mail to: customer.emailClt, subject: "Estimad@ " + customer.nombreClt + " " + customer.apaternoClt + ", tiene una cita en Rudolph Baker & Associates"
  	end
end
