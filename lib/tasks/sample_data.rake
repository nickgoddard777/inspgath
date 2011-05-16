require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    Exhibitor.create!(
        :name        => "Test Name",
        :website     => "http://www.test.com",
        :address1    => "1 somehwere",
        :address2    => "conisbrough",
        :city        => "doncaster",
        :county      => "s. yorks",
        :postcode    => "dn12 3hh",
        :tel_no      => "01709 883388",
        :email       => "test@user.com",
        :description => "This is a test exhibitor")
    99.times do |n|
      name        = Faker::Name.name
      email       = "example-#{n+1}@test.com"
      website     = "http://www.example-#{n+1}.com"
      Exhibitor.create!(
        :name        => name,
        :website     => website,
        :address1    => "1 somehwere",
        :address2    => "conisbrough",
        :city        => "doncaster",
        :county      => "s. yorks",
        :postcode    => "dn12 3hh",
        :tel_no      => "01709 883388",
        :email       => email,
        :description => "This is a test exhibitor")
    end
  end
end

