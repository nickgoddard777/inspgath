class Page < ActiveRecord::Base
  attr_accessible :title, :page_type, :body
end
