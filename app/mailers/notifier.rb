class Notifier < ActionMailer::Base
	def contact_notifier(sender)
		@sender = sender
		mail(:to => "nicko777@gmail.com",
			:from => sender.email,
			:subject => "New #{sender.contact_type}")
	end
end
