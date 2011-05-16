class CreateExhibitors < ActiveRecord::Migration
  def self.up
    create_table :exhibitors do |t|
      t.string :name
      t.string :website
      t.string :address1
      t.string :address2
      t.string :city
      t.string :county
      t.string :postcode
      t.string :tel_no
      t.string :email
      t.text :description

      t.timestamps
    end
    add_index :exhibitors, :website, :unique => true
    add_index :exhibitors, :email, :unique => true
  end

  def self.down
    remove_index :exhibitors, :website
    remove_index :exhibitors, :email
    drop_table :exhibitors
  end
end

