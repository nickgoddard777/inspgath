# == Schema Information
# Schema version: 20110514175326
#
# Table name: categories
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Category < ActiveRecord::Base
	attr_accessible :name, :description
	
	has_many :events
	
	validates		:name,	:presence 		=> true,
							:uniqueness 	=> { :case_sensitive => false }
	
	validates		:description,	:presence => true
end
