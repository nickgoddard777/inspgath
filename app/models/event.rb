class Event < ActiveRecord::Base
	attr_accessible :title, :description, :startdate, :enddate, :url_link, :category_id
	
	belongs_to :category
	
	validates	:title,			:presence => true
	
	validates	:description,	:presence => true
	
	validate	:start_date_cannot_be_in_the_past
	
	validate	:end_date_cannot_be_earlier_than_the_start_date
	
	def start_date_cannot_be_in_the_past
		errors.add(:start_date, "can't be in the past") if !startdate.blank? and startdate < Date.today
	end
	
	def end_date_cannot_be_earlier_than_the_start_date
		errors.add(:end_date, "can't be before the start date") if !enddate.blank? and enddate <= startdate
	end
	
	def self.next_five
		self.all(:conditions => ['startdate > :end_of_day'], :limit => 5, :order => "startdate ASC")
	end
end
