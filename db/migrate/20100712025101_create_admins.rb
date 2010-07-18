class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table :admins do |t|
      t.database_authenticatable
      t.lockable
      t.trackable
      t.timestamps
    end
    Admin.create(:email => "admin@domain.com", :password => "password")
  end

  def self.down
    drop_table :admins
  end
end
