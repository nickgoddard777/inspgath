Factory.define :user do |user|
	user.name					"Joe Bloggs"
	user.email					"jbloggs@example.co.uk"
	user.password				"foobar"
	user.password_confirmation	"foobar"
end

Factory.define :exhibitor do |exhibitor|
  exhibitor.name        "Test Name"
  exhibitor.website     "http://www.test.com"
  exhibitor.address1    "1 somehwere"
  exhibitor.address2    "conisbrough"
  exhibitor.city        "doncaster"
  exhibitor.county      "s. yorks"
  exhibitor.postcode    "dn12 3hh"
  exhibitor.tel_no      "01709 883388"
  exhibitor.email       "test@user.com"
  exhibitor.description "This is a test exhibitor"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.sequence :website do |n|
  "http://www.company-#{n}.net"
end

