class Contact
	include ActiveModel::Validations

	validates_presence_of :email, :name, :contact_type, :event, :body

  attr_accessor :email, :name, :contact_type, :event, :body

	def initialize(attributes = {})
		attributes.each do |key, value|
			self.send("#{key}=", value)
		end
		@attributes = attributes
	end

	def read_attribute_for_validation(key)
		@attributes[key]
	end

	def to_key
	end

	def save
		if self.valid?
			Notifier.contact_notifier(self).deliver
			return true
		end
		return false
	end
end

