# == Schema Information
# Schema version: 20110514175326
#
# Table name: exhibitors
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  website     :string(255)
#  address1    :string(255)
#  address2    :string(255)
#  city        :string(255)
#  county      :string(255)
#  postcode    :string(255)
#  tel_no      :string(255)
#  email       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Exhibitor < ActiveRecord::Base
  attr_accessible :name, :email, :website, :description, :address1, :address2, :city, :county, :postcode, :tel_no

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  validates   :name,          :presence => true,
                              :length => { :maximum => 50}
  validates   :email,         :presence => true,
                              :length => { :maximum => 100},
                              :format   => { :with => email_regex },
                              :uniqueness => true
  validates   :website,       :presence => true,
                              :length => { :maximum => 100},
                              :uniqueness => true
  validates   :description,   :presence => true
  validates   :address1,      :presence => true,
                              :length => { :maximum => 50}
  validates   :address2,      :presence => true,
                              :length => { :maximum => 50}
  validates   :city,          :presence => true,
                              :length => { :maximum => 50}
  validates   :county,        :presence => true,
                              :length => { :maximum => 50}
  validates   :postcode,      :presence => true,
                              :length => { :maximum => 50}
  validates   :tel_no,        :presence => true,
                              :length => { :maximum => 15}
end

