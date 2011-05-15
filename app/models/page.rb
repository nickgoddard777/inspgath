# == Schema Information
# Schema version: 20110514175326
#
# Table name: pages
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  page_type  :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Page < ActiveRecord::Base
  attr_accessible :title, :page_type, :body
end
