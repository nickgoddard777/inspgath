class Notifier < ActionMailer::Base
  default :to => "info@inspirationalgatherings.co.uk"
	def contact_notifier(sender)
		@sender = sender
		mail(:from => @sender.email,
			:subject => "New #{@sender.contact_type} for Inspirational Gatherings")
	end
end

