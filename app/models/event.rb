class Event < ActiveRecord::Base
  attr_accessible :title, :description, :startdate, :enddate, :url_link, :category
end
